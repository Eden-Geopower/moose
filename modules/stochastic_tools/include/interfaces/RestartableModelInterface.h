//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "PublicRestartable.h"
#include "StochasticToolsApp.h"

/**
 * An interface class which manages the model data save and load functionalities from moose objects
 * (such as surrogates, mappings, etc.) in the stochastic tools module.
 * */
class RestartableModelInterface
{
public:
  static InputParameters validParams();

  RestartableModelInterface(const MooseObject & object,
                            const bool read_only,
                            const std::string & meta_data_name);

  ///@{
  /**
   * Declare model data for loading from file as well as restart
   */
  // MOOSEDOCS_BEGIN
  template <typename T, typename... Args>
  T & declareModelData(const std::string & data_name, Args &&... args);
  // MOOSEDOCS_END
  ///@}

  ///@{
  /**
   * Retrieve model data from the interface
   */
  template <typename T, typename... Args>
  const T & getModelData(const std::string & data_name, Args &&... args) const;
  ///@}

  /// Accessor for the name of the model meta data
  const std::string & modelMetaDataName() const { return _model_meta_data_name; }

private:
  /// Reference to the MooseObject that uses this interfface
  const MooseObject & _object;

  /// The model meta data name. This is used to store the restartable data within the
  /// RestartableDataMap.
  const std::string _model_meta_data_name;

  /**
   * Member for interfacing with the framework's restartable system. We need this because
   * we would like to have the capability to handle the model data separately from the
   * other data members used for checkpointing.
   */
  PublicRestartable _model_restartable;
};

template <typename T, typename... Args>
T &
RestartableModelInterface::declareModelData(const std::string & data_name, Args &&... args)
{
  return _model_restartable.declareRestartableData<T>(data_name, std::forward<Args>(args)...);
}

template <typename T, typename... Args>
const T &
RestartableModelInterface::getModelData(const std::string & data_name, Args &&... args) const
{
  return _model_restartable.getRestartableData<T>(data_name, std::forward<Args>(args)...);
}
