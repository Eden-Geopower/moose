//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

// MOOSE includes
#include "ComponentAction.h"
#include "PhysicsComponentHelper.h"

/**
 * Component whose mesh is generated in the [Mesh] block on which one can define a Physics.
 */
class MeshGeneratorComponent : public virtual ComponentAction, public PhysicsComponentHelper
{
public:
  /**
   * Class constructor
   */
  static InputParameters validParams();

  MeshGeneratorComponent(const InputParameters & params);

protected:
  virtual void addMeshGenerators() override;
  virtual void initComponentPhysics() override;
};
