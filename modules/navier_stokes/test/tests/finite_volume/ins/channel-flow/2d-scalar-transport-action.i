mu=1
rho=1
k=1e-3
diff=1e-3
cp=1

[Mesh]
  [gen]
    type = GeneratedMeshGenerator
    dim = 2
    xmin = 0
    xmax = 10
    ymin = -1
    ymax = 1
    nx = 100
    ny = 20
  []
[]

[Variables]
  inactive = 'scalar'
  [scalar]
    type = MooseVariableFVReal
    initial_condition = 0.0
  []
[]

[Modules]
  [NavierStokesFV]
    simulation_type = 'steady-state'
    compressibility = 'incompressible'
    add_energy_equation = true

    passive_scalar_names = 'scalar'

    density = ${rho}
    dynamic_viscosity = ${mu}
    thermal_conductivity = ${k}
    specific_heat = ${cp}
    passive_scalar_diffusivity = ${diff}
    passive_scalar_source = 0.1

    initial_velocity = '1 1 0'
    initial_pressure = 0.0
    initial_temperature = 0.0

    inlet_boundaries = 'left'
    momentum_inlet_types = 'fixed-velocity'
    momentum_inlet_function = '1 0'
    energy_inlet_types = 'fixed-temperature'
    energy_inlet_function = '1'
    passive_scalar_inlet_types = 'fixed-value'
    passive_scalar_inlet_function = '1'

    wall_boundaries = 'top bottom'
    momentum_wall_types = 'noslip noslip'
    energy_wall_types = 'heatflux heatflux'
    energy_wall_function = '0 0'

    outlet_boundaries = 'right'
    momentum_outlet_types = 'fixed-pressure'
    pressure_function = '0'
  []
[]

[Executioner]
  type = Steady
  solve_type = 'NEWTON'
  petsc_options_iname = '-pc_type -ksp_gmres_restart -sub_pc_type -sub_pc_factor_shift_type'
  petsc_options_value = 'asm      100                lu           NONZERO'
  line_search = 'none'
  nl_rel_tol = 1e-12
[]

[Outputs]
  exodus = true
  csv = true
[]
