[GlobalParams]
  initial_p = 6e6
  initial_T = 530
  initial_vel = 2

  gravity_vector = '9.81 0 0'

  scaling_factor_1phase = '1. 1. 1'

  closures = simple

  spatial_discretization = cg
[]

[FluidProperties]
  [./eos]
    type = StiffenedGasFluidProperties
    gamma = 2.35
    q = -1167e3
    q_prime = 0
    p_inf = 1.e9
    cv = 1816
  [../]
[]

[Components]
  [./pipe]
    type = FlowChannel1Phase
    fp = eos
    # geometry
    position = '0 0 0'
    orientation = '1 0 0'
    A = 1e-4
    D_h = 1.12837916709551
    f = 0.1
    length = 1
    n_elems = 2
  [../]

  [./outlet]
    type = Outlet1Phase
    input = 'pipe:out'
    p = 6e6
    legacy = true
  [../]
[]

[Preconditioning]
  [./SMP_PJFNK]
    type = SMP
    full = true
    petsc_options_iname = '-snes_type -snes_test_err'
    petsc_options_value = 'test       1e-11'
  [../]
[]

[Executioner]
  type = Transient

  start_time = 0
  dt = 1e-2
  num_steps = 1
  abort_on_solve_fail = true

  solve_type = 'NEWTON'
  nl_rel_tol = 1e-9
  nl_abs_tol = 1e-7
  nl_max_its = 5

  l_tol = 1e-3
  l_max_its = 100

  [./Quadrature]
    type = TRAP
    order = FIRST
  [../]
[]
