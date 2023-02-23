//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "MooseObject.h"
#include "MeshMetaDataInterface.h"
#include "MooseApp.h"

// Included so mesh generators don't need to include this when constructing MeshBase objects
#include "MooseMesh.h"

#include "libmesh/mesh_base.h"
#include "libmesh/parameters.h"

class MooseMesh;
namespace libMesh
{
class ReplicatedMesh;
class DistributedMesh;
}

/**
 * MeshGenerators are objects that can modify or add to an existing mesh.
 */
class MeshGenerator : public MooseObject, public MeshMetaDataInterface
{
public:
  /**
   * Constructor
   *
   * @param parameters The parameters object holding data for the class to use.
   */
  static InputParameters validParams();

  MeshGenerator(const InputParameters & parameters);

  /**
   * Generate / modify the mesh
   */
  virtual std::unique_ptr<MeshBase> generate() = 0;

  /**
   * Internal generation method - this is what is actually called
   * within MooseApp to execute the MeshGenerator.
   */
  std::unique_ptr<MeshBase> generateInternal();

  /**
   * Return the MeshGenerators that must run before this MeshGenerator
   */
  std::vector<std::string> & getDependencies() { return _depends_on; }

  /**
   * Return whether or not to save the current mesh
   */
  bool saveMesh();

  /**
   * Return the name of the saved mesh
   */
  const std::string getSavedMeshName();

protected:
  /**
   * Methods for writing out attributes to the mesh meta-data store, which can be retrieved from
   * most other MOOSE systems and is recoverable.
   */
  template <typename T>
  T & declareMeshProperty(const std::string & data_name);

  template <typename T>
  T & declareMeshProperty(const std::string & data_name, const T & init_value);

  /**
   * Method for updating attributes to the mesh meta-data store, which can only be invoked in
   * the MeshGenerator generate routine only if the mesh generator property has already been
   * declared.
   */
  template <typename T>
  T & setMeshProperty(const std::string & data_name, const T & data_value);

  /**
   * Takes the name of a MeshGeneratorName parameter and then gets a pointer to the
   * Mesh that MeshGenerator is going to create.
   *
   * That MeshGenerator is made to be a dependency of this one, so
   * will generate() its mesh first.
   *
   * @param allow_invalid If true, will allow for invalid parameters and will return a nullptr
   * mesh if said parameter does not exist
   * @return The Mesh generated by that MeshGenerator
   *
   * NOTE: You MUST catch this by reference!
   */
  std::unique_ptr<MeshBase> & getMesh(const std::string & param_name,
                                      const bool allow_invalid = false);

  /**
   * Like getMesh(), but for multiple generators.
   *
   * @returns The generated meshes
   */
  std::vector<std::unique_ptr<MeshBase> *> getMeshes(const std::string & param_name);

  /**
   * Like \p getMesh(), but takes the name of another MeshGenerator directly.
   *
   * NOTE: You MUST catch this by reference!
   *
   * @return The Mesh generated by that MeshGenerator
   */
  std::unique_ptr<MeshBase> & getMeshByName(const MeshGeneratorName & mesh_generator_name);

  /**
   * Like getMeshByName(), but for multiple generators.
   *
   * @returns The generated meshes
   */
  std::vector<std::unique_ptr<MeshBase> *>
  getMeshesByName(const std::vector<MeshGeneratorName> & mesh_generator_names);

  /// References to the mesh and displaced mesh (currently in the ActionWarehouse)
  std::shared_ptr<MooseMesh> & _mesh;

  /// References to the mesh and displaced mesh (currently in the ActionWarehouse)
  std::map<std::string, std::unique_ptr<MeshBase> *> _save_in_meshes;

  /**
   * Build a \p MeshBase object whose underlying type will be determined by the Mesh input file
   * block
   * @param dim The logical dimension of the mesh, e.g. 3 for hexes/tets, 2 for quads/tris. If the
   * caller doesn't specify a value for \p dim, then the value in the \p Mesh input file block will
   * be used
   */
  std::unique_ptr<MeshBase> buildMeshBaseObject(unsigned int dim = libMesh::invalid_uint);

  /**
   * Build a replicated mesh
   * @param dim The logical dimension of the mesh, e.g. 3 for hexes/tets, 2 for quads/tris. If the
   * caller doesn't specify a value for \p dim, then the value in the \p Mesh input file block will
   * be used
   */
  std::unique_ptr<ReplicatedMesh> buildReplicatedMesh(unsigned int dim = libMesh::invalid_uint);

  /**
   * Build a distributed mesh that has correct remote element removal behavior and geometric
   * ghosting functors based on the simulation objects
   * @param dim The logical dimension of the mesh, e.g. 3 for hexes/tets, 2 for quads/tris. If the
   * caller doesn't specify a value for \p dim, then the value in the \p Mesh input file block will
   * be used
   */
  std::unique_ptr<DistributedMesh> buildDistributedMesh(unsigned int dim = libMesh::invalid_uint);

  /**
   * Construct a "subgenerator", a different MeshGenerator subclass
   * that will be added to the same MooseApp on the fly.
   *
   * The new MeshGenerator will be a dependency of this one, so will
   * generate() its mesh first.
   *
   * @return The Mesh generated by the new MeshGenerator subgenerator
   *
   * NOTE: You MUST catch this by reference!
   */
  template <typename... Ts>
  std::unique_ptr<MeshBase> & addMeshSubgenerator(const std::string & generator_name,
                                                  const std::string & name,
                                                  Ts... extra_input_parameters);

  /**
   * Construct a "subgenerator", as above.  User code is responsible
   * for constructing valid InputParameters.
   * @param generator_name the name of the class, also known as the type, of the subgenerator
   * @param name the object name of the subgenerator
   * @param params the input parameters for the subgenerator
   * @return The Mesh generated by the new MeshGenerator subgenerator
   */
  std::unique_ptr<MeshBase> & addMeshSubgenerator(const std::string & generator_name,
                                                  const std::string & name,
                                                  InputParameters & params);

private:
  /// A list of generators that are required to run before this generator may run
  std::vector<std::string> _depends_on;

  /// A nullptr to use for when inputs aren't specified
  std::unique_ptr<MeshBase> _null_mesh = nullptr;

  /// A user-defined name to save the mesh
  std::string _save_with_name;
};

template <typename T>
T &
MeshGenerator::declareMeshProperty(const std::string & data_name)
{
  if (_app.executingMeshGenerators())
    mooseError(
        "Declaration of mesh meta data can only happen within the constructor of mesh generators");

  std::string full_name =
      std::string(MeshMetaDataInterface::SYSTEM) + "/" + name() + "/" + data_name;

  // Here we will create the RestartableData even though we may not use this instance.
  // If it's already in use, the App will return a reference to the existing instance and we'll
  // return that one instead. We might refactor this to have the app create the RestartableData
  // at a later date.
  auto data_ptr = std::make_unique<RestartableData<T>>(full_name, nullptr);
  auto & restartable_data_ref = static_cast<RestartableData<T> &>(_app.registerRestartableData(
      full_name, std::move(data_ptr), 0, false, MooseApp::MESH_META_DATA));

  return restartable_data_ref.set();
}

template <typename T>
T &
MeshGenerator::declareMeshProperty(const std::string & data_name, const T & init_value)
{
  T & data = declareMeshProperty<T>(data_name);
  data = init_value;

  return data;
}

template <typename T>
T &
MeshGenerator::setMeshProperty(const std::string & data_name, const T & data_value)
{
  if (!_app.executingMeshGenerators())
    mooseError("Updating mesh meta data cannot occur in the constructor of mesh generators");

  std::string full_name =
      std::string(MeshMetaDataInterface::SYSTEM) + "/" + name() + "/" + data_name;

  if (_app.getRestartableMetaData(full_name, MooseApp::MESH_META_DATA, 0).type() !=
      MooseUtils::prettyCppType(&data_value))
    mooseError("Data type of metadata value must match the original data type of the metadata");
  auto & restartable_data_ref = dynamic_cast<RestartableData<T> &>(
      _app.getRestartableMetaData(full_name, MooseApp::MESH_META_DATA, 0));
  T & data = restartable_data_ref.set();
  data = data_value;

  return data;
}

template <typename... Ts>
std::unique_ptr<MeshBase> &
MeshGenerator::addMeshSubgenerator(const std::string & generator_name,
                                   const std::string & name,
                                   Ts... extra_input_parameters)
{
  InputParameters subgenerator_params = _app.getFactory().getValidParams(generator_name);

  subgenerator_params.setParameters(extra_input_parameters...);

  return this->addMeshSubgenerator(generator_name, name, subgenerator_params);
}
