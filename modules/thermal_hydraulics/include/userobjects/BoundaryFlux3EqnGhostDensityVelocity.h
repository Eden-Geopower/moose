//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "BoundaryFlux3EqnGhostBase.h"

class SinglePhaseFluidProperties;

/**
 * Computes boundary flux from densities and velocities for the 3-equation model
 * using a ghost cell approach.
 */
class BoundaryFlux3EqnGhostDensityVelocity : public BoundaryFlux3EqnGhostBase
{
public:
  BoundaryFlux3EqnGhostDensityVelocity(const InputParameters & parameters);

protected:
  virtual std::vector<Real>
  getGhostCellSolution(const std::vector<Real> & U_interior) const override;
  virtual DenseMatrix<Real>
  getGhostCellSolutionJacobian(const std::vector<Real> & U_interior) const override;

  /// Specified density
  const Real & _rho;
  /// Specified velocity
  const Real & _vel;
  /// Reversibility
  const bool & _reversible;
  /// Fluid properties object
  const SinglePhaseFluidProperties & _fp;

public:
  static InputParameters validParams();
};
