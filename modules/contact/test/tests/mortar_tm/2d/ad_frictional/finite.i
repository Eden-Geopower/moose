E_block = 1e7
E_plank = 1e7
elem = QUAD4
order = FIRST
name = 'finite'

[Mesh]
  patch_size = 80
  patch_update_strategy = auto
  [plank]
    type = GeneratedMeshGenerator
    dim = 2
    xmin = -0.3
    xmax = 0.3
    ymin = -10
    ymax = 10
    nx = 2
    ny = 67
    elem_type = ${elem}
    boundary_name_prefix = plank
  []
  [plank_id]
    type = SubdomainIDGenerator
    input = plank
    subdomain_id = 1
  []

  [block]
    type = GeneratedMeshGenerator
    dim = 2
    xmin = 0.31
    xmax = 0.91
    ymin = 7.7
    ymax = 8.5
    nx = 3
    ny = 4
    elem_type = ${elem}
    boundary_name_prefix = block
    boundary_id_offset = 10
  []
  [block_id]
    type = SubdomainIDGenerator
    input = block
    subdomain_id = 2
  []

  [combined]
    type = MeshCollectionGenerator
    inputs = 'plank_id block_id'
  []
  [block_rename]
    type = RenameBlockGenerator
    input = combined
    old_block = '1 2'
    new_block = 'plank block'
  []
[]

[GlobalParams]
  displacements = 'disp_x disp_y'
[]

[Variables]
  [disp_x]
    order = ${order}
    block = 'plank block'
    scaling = '${fparse 2.0 / (E_plank + E_block)}'
  []
  [disp_y]
    order = ${order}
    block = 'plank block'
    scaling = '${fparse 2.0 / (E_plank + E_block)}'
  []
[]

[Modules/TensorMechanics/Master]
  [action]
    strain = FINITE
    generate_output = 'stress_xx stress_yy stress_zz vonmises_stress hydrostatic_stress strain_xx '
                      'strain_yy strain_zz'
    block = 'plank block'
    use_automatic_differentiation = true
  []
[]

[Contact]
  [frictional]
    primary = plank_right
    secondary = block_left
    formulation = mortar
    model = coulomb
    normalize_c = true
    c_normal = 1e5
    c_tangential = 1e5
    friction_coefficient = 0.1
    use_dual = true
  []
[]

[BCs]
  [left_x]
    type = ADDirichletBC
    variable = disp_x
    boundary = plank_left
    value = 0.0
    preset = false
  []
  [left_y]
    type = ADDirichletBC
    variable = disp_y
    boundary = plank_bottom
    value = 0.0
    preset = false
  []
  [right_x]
    type = ADFunctionDirichletBC
    variable = disp_x
    boundary = block_right
    function = '-0.04*sin(4*(t+1.5))+0.02'
    preset = false
  []
  [right_y]
    type = ADFunctionDirichletBC
    variable = disp_y
    boundary = block_right
    function = '-t'
    preset = false
  []
[]

[Materials]
  [plank]
    type = ADComputeIsotropicElasticityTensor
    block = 'plank'
    poissons_ratio = 0.3
    youngs_modulus = ${E_plank}
  []
  [block]
    type = ADComputeIsotropicElasticityTensor
    block = 'block'
    poissons_ratio = 0.3
    youngs_modulus = ${E_block}
  []
  [stress]
    type = ADComputeFiniteStrainElasticStress
    block = 'plank block'
  []
[]

[Executioner]
  type = Transient
  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason -ksp_converged_reason'
  petsc_options_iname = '-pc_type -pc_factor_shift_type -pc_factor_shift_amount'
  petsc_options_value = 'lu        NONZERO               1e-15'
  end_time = 13.5
  dt = 0.1
  dtmin = 0.1
  timestep_tolerance = 1e-6
  line_search = 'contact'
  nl_div_tol = 1e+100
  nl_abs_tol = 1e-7
  automatic_scaling = true
  compute_scaling_once = false
  ignore_variables_for_autoscaling = 'frictional_normal_lm frictional_tangential_lm'
[]

[Postprocessors]
  [nl_its]
    type = NumNonlinearIterations
  []
  [total_nl_its]
    type = CumulativeValuePostprocessor
    postprocessor = nl_its
  []
  [l_its]
    type = NumLinearIterations
  []
  [total_l_its]
    type = CumulativeValuePostprocessor
    postprocessor = l_its
  []
  [contact]
    type = ContactDOFSetSize
    variable = frictional_normal_lm
    subdomain = frictional_secondary_subdomain
  []
  [avg_hydro]
    type = ElementAverageValue
    variable = hydrostatic_stress
    block = 'block'
  []
  [max_hydro]
    type = ElementExtremeValue
    variable = hydrostatic_stress
    block = 'block'
  []
  [min_hydro]
    type = ElementExtremeValue
    variable = hydrostatic_stress
    block = 'block'
    value_type = min
  []
  [avg_vonmises]
    type = ElementAverageValue
    variable = vonmises_stress
    block = 'block'
  []
  [max_vonmises]
    type = ElementExtremeValue
    variable = vonmises_stress
    block = 'block'
  []
  [min_vonmises]
    type = ElementExtremeValue
    variable = vonmises_stress
    block = 'block'
    value_type = min
  []
[]

[Outputs]
  file_base = ${name}
  [comp]
    type = CSV
    show = 'contact'
  []
[]

[Debug]
  show_var_residual_norms = true
[]
