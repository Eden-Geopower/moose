pi = 3.14159265359
period = 1
num_steps = 200
dt = ${fparse period/num_steps}
cp = 5.0

[Functions]
  [src_func]
    type = ParsedFunction
    value = "20*sin(2*${pi}/${period}*t)"
  []
[]

[Mesh]
  [msh]
    type = GeneratedMeshGenerator
    dim = 2
    nx = 100
    xmin = -0.5
    xmax = 0.5
    ny = 100
    ymin = -0.5
    ymax = 0.5
  []
  [source_domain]
    type = ParsedSubdomainMeshGenerator
    input = msh
    combinatorial_geometry = '(x<0.2 & x>-0.2) & (y<0.2 & y>-0.2)'
    block_id=1
  []
[]

[Variables]
  [T]
    initial_condition = 0
  []
[]

[Kernels]
  [diffusion]
    type = Diffusion
    variable = T
  []
  [source]
    type = BodyForce
    variable = T
    function = src_func
    block = 1
  []
  [anti_source]
    type = BodyForce
    variable = T
    value = 0
    block = 1
  []
  [time_deriv]
    type = CoefTimeDerivative
    Coefficient = ${cp}
    variable = T
  []
[]

[BCs]
  [neumann_rest]
    type = NeumannBC
    variable = T
    boundary = 'left right top bottom'
    value = 0
  []
[]

[Executioner]
  type = Transient
  num_steps = ${num_steps}
  dt = ${dt}
  solve_type = NEWTON
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'
  nl_abs_tol = 1e-12
  line_search = 'none'
[]

[Postprocessors]
  [T_max]
    type = NodalExtremeValue
    variable = T
    value_type = max
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [T_min]
    type = NodalExtremeValue
    variable = T
    value_type = min
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [control_value]
    type = Receiver
    execute_on = 'INITIAL TIMESTEP_END'
  []
[]

[Controls]
  [src_control]
    type = LibtorchNeuralNetControl
    parameters = "Kernels/anti_source/value"
    postprocessors = "control_value"
    responses = 'T_max T_min'
    response_shift_coeffs = '0.25 -0.06'
    response_normalization_coeffs = '0.25 0.012'
    use_old_response = true
  []
[]

[Reporters]
  [T_reporter]
    type = AccumulateReporter
    reporters = 'T_max/value T_min/value control_value/value'
  []
[]

[Outputs]
  [csv]
    type = CSV
    execute_on = FINAL
  []
  exodus = true
[]
