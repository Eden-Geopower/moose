[Mesh]
  [gmg]
    type = GeneratedMeshGenerator
    dim = 1
    nx = 2
  []
[]

[Problem]
  linear_sys_names = 'u_sys'
[]

[Variables]
  [u]
    type = MooseLinearVariableFVReal
    linear_sys = 'u_sys'
    initial_condition = 1.0
  []
[]

[LinearFVKernels]
  [diffusion]
    type = LinearFVDiffusionKernel
    variable = u
    diffusion_coeff = diff_coeff_func
  []
  [advection]
    type = LinearFVAdvectionKernel
    variable = u
    velocity = "0.5 0 0"
    advected_interp_method = average
  []
  [reaction]
    type = LinearFVReactionKernel
    variable = u
    coeff = coeff_func
  []
  [source]
    type = LinearFVSourceKernel
    variable = u
    source_density = source_func
  []
[]

[LinearFVBCs]
  inactive = "outflow"
  [dir]
    type = LinearFVFunctorDirichletBC
    variable = u
    boundary = "left right"
    functor = analytic_solution
  []
  [outflow]
    type = LinearFVOutflowBC
    variable = u
    boundary = "right"
    velocity = "0.5 0 0"
    use_two_term_expansion = true
  []
[]

[Functions]
  [diff_coeff_func]
    type = ParsedFunction
    expression = '1+0.5*x'
  []
  [coeff_func]
    type = ParsedFunction
    expression = '1+1/(1+x)'
  []
  [source_func]
    type = ParsedFunction
    expression = '(1+1/(x+1))*(sin(pi/2*x)+1.5)+0.25*pi*pi*(0.5*x+1)*sin(pi/2*x)'
  []
  [analytic_solution]
    type = ParsedFunction
    expression = 'sin(pi/2*x)+1.5'
  []
[]

[Postprocessors]
  [h]
    type = AverageElementSize
    execute_on = FINAL
  []
  [error]
    type = ElementL2FunctorError
    approximate = u
    exact = analytic_solution
    execute_on = FINAL
  []
[]

[Executioner]
  type = LinearPicardSteady
  linear_systems_to_solve = u_sys
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'
[]

[Outputs]
  [csv]
    type = CSV
    execute_on = FINAL
  []
[]
