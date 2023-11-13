

//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "AuxKernel.h"

#include "INSFVVelocityVariable.h"
/**
 * Computes the turbuent viscosity for the k-Epsilon model.
 * Implements two near-wall treatements: equilibrium and non-equilibrium wall functions.
 */
class kEpsilonViscosityAux : public AuxKernel
{
public:
  static InputParameters validParams();

  kEpsilonViscosityAux(const InputParameters & parameters);

protected:
  virtual Real computeValue() override;

  // Local method to find friction velocty
  // Note: this method may be to need reimplemented for each new turbulent model
  ADReal findUStarLocalMethod(const ADReal & u, const Real & dist);

  /// the dimension of the simulation
  const unsigned int _dim;

  /// x-velocity
  const INSFVVelocityVariable * const _u_var;
  /// y-velocity
  const INSFVVelocityVariable * const _v_var;
  /// z-velocity
  const INSFVVelocityVariable * const _w_var;

  /// Turbulent kinetic energy
  const Moose::Functor<ADReal> & _k;
  /// Turbulent kinetic energy dissipation rate
  const Moose::Functor<ADReal> & _epsilon;

  /// Density
  const Moose::Functor<ADReal> & _rho;
  /// Dynamic viscosity
  const Moose::Functor<ADReal> & _mu;

  /// C-mu closure coefficient
  const Real _C_mu;

  /// Wall boundaries
  std::vector<BoundaryName> _wall_boundary_names;

  /// Linearzied computation of y_plus ?
  const bool _linearized_yplus;

  /// Linearzied computation of y_plus ?
  const bool _bulk_wall_treatment;

  /// Non-equilibrium wall treatement ?
  const bool _non_equilibrium_treatement;

  /// -- Parameters of the wall function method

  /// Maximum number of iterations to find the friction velocity
  static constexpr int _MAX_ITERS_U_TAU{50};

  /// Relative tolerance to find the friction velocity
  static constexpr Real _REL_TOLERANCE{1e-4};

  /// -- Constants of the method
  static constexpr Real _von_karman{0.4187};
  static constexpr Real _E{9.793};

  /// --- Maps for wall bounded elements
  std::map<const Elem *, bool> _wall_bounded;
  std::map<const Elem *, std::vector<Real>> _dist;
  std::map<const Elem *, std::vector<Point>> _normal;
};
