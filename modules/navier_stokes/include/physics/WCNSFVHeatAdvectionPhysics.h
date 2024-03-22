//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "WCNSFVPhysicsBase.h"
#include "NS.h"

/**
 * Creates all the objects needed to solve the Navier Stokes energy equation
 */
class WCNSFVHeatAdvectionPhysics final : public WCNSFVPhysicsBase
{
public:
  static InputParameters validParams();

  WCNSFVHeatAdvectionPhysics(const InputParameters & parameters);

  /// Get the name of the specific heat material property
  const MooseFunctorName & getSpecificHeatName() const { return _specific_heat_name; }
  const MooseFunctorName getSpecificEnthalpyName() const { return NS::specific_enthalpy; }

  /// Whether the physics is actually creating the heat equation
  bool hasEnergyEquation() const { return _has_energy_equation; }

protected:
private:
  void addNonlinearVariables() override;
  void addInitialConditions() override;
  void addFVKernels() override;
  void addFVBCs() override;
  void addMaterials() override;

  unsigned short getNumberAlgebraicGhostingLayersNeeded() const override;

  /**
   * Functions adding kernels for the incompressible / weakly compressible energy equation
   * If the material properties are not constant, some of these can be used for
   * weakly-compressible simulations as well.
   */
  void addINSEnergyTimeKernels();
  void addWCNSEnergyTimeKernels();
  void addINSEnergyHeatConductionKernels();
  void addINSEnergyAdvectionKernels();
  void addINSEnergyAmbientConvection();
  void addINSEnergyExternalHeatSource();
  void addWCNSEnergyMixingLengthKernels();

  /// Functions adding boundary conditions for the incompressible simulation.
  /// These are used for weakly-compressible simulations as well.
  void addINSEnergyInletBC();
  void addINSEnergyWallBC();

  /// Process thermal conductivity (multiple functor input options are available).
  /// Return true if we have vector thermal conductivity and false if scalar
  bool processThermalConductivity();

  /// A boolean to help compatibility with the old Modules/NavierStokesFV syntax
  const bool _has_energy_equation;
  /// Name of the specific heat material property
  MooseFunctorName _specific_heat_name;
  /// Vector of subdomain groups where we want to have different thermal conduction
  std::vector<std::vector<SubdomainName>> _thermal_conductivity_blocks;
  /// Name of the thermal conductivity functor for each block-group
  std::vector<MooseFunctorName> _thermal_conductivity_name;

  /// Vector of subdomain groups where we want to have different ambient convection
  std::vector<std::vector<SubdomainName>> _ambient_convection_blocks;
  /// Name of the ambient convection heat transfer coefficients for each block-group
  std::vector<MooseFunctorName> _ambient_convection_alpha;
  /// Name of the solid domain temperature for each block-group
  std::vector<MooseFunctorName> _ambient_temperature;

  /// Energy inlet boundary types
  MultiMooseEnum _energy_inlet_types;
  /// Functors describing the inlet boundary values. See energy_inlet_types for what the functors actually represent
  std::vector<MooseFunctorName> _energy_inlet_functors;
  /// Energy wall boundary types
  MultiMooseEnum _energy_wall_types;
  /// Functors describing the wall boundary values. See energy_wall_types for what the functors actually represent
  std::vector<MooseFunctorName> _energy_wall_functors;
};
