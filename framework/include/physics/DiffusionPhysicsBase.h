//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "PhysicsBase.h"

/**
 * Base class to host all common parameters and attributes of Physics actions to solve the diffusion
 * equation
 */
class DiffusionPhysicsBase : public PhysicsBase
{
public:
  static InputParameters validParams();

  DiffusionPhysicsBase(const InputParameters & parameters);

protected:
  /// Name of the diffused variable
  const VariableName & _var_name;
  /// Boundaries on which a Neumann boundary condition is applied
  const std::vector<BoundaryName> & _neumann_boundaries;
  /// Boundaries on which a Dirichlet boundary condition is applied
  const std::vector<BoundaryName> & _dirichlet_boundaries;
};
