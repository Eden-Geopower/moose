CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes         num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_el_in_blk2        num_nod_per_el2       num_side_ss1      num_side_ss2      num_side_ss3      num_side_ss4      num_side_ss5      num_nod_ns1       num_nod_ns2       num_nod_ns3       num_nod_ns4       num_nod_ns5       num_elem_var      num_info  A         api_version       @�
=   version       @�
=   floating_point_word_size            	file_size               int64_status             title         phy.sub_discretization_out.e       maximum_name_length                 &   
time_whole                            s�   	eb_status                             
�   eb_prop1               name      ID              
�   	ns_status         	                    
�   ns_prop1      	         name      ID              
�   	ss_status         
                    
�   ss_prop1      
         name      ID              
�   coordx                             
�   coordy                                coordz                             8   eb_names                       D      X   ns_names      	                 �      �   ss_names      
                 �      D   
coor_names                         d      �   node_num_map                          P   connect1                  	elem_type         EDGE2               `   connect2                  	elem_type         EDGE2               p   elem_num_map                          x   elem_ss1                          �   side_ss1                          �   elem_ss2                          �   side_ss2                          �   elem_ss3                          �   side_ss3                          �   elem_ss4                          �   side_ss4                          �   elem_ss5                          �   side_ss5                          �   node_ns1                          �   node_ns2                          �   node_ns3                          �   node_ns4                          �   node_ns5                          �   name_elem_var                          $      �   vals_elem_var1eb1                                s�   vals_elem_var1eb2                                s�   elem_var_tab                                info_records                      e�                                                                                          ?�      ?�      @                                               <��&3\<�y9L��
<��&3\pipe:r1                          pipe:r2                            pipe                                                                                               inlet                            outlet                              pipe:in                          pipe                             inlet                            pipe:out                         outlet                                                                                                                                                                                                                                                             A                                         ####################                                                             # Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                    /Users/andrsd/workspace/thm/thm-opt -i phy.sub_discretization.i --error --er... ror-unused --error-override --no-gdb-backtrace### Version Info ###                                                                                                Framework Information:                                                           MOOSE Version:           git commit c4d71de1ea on 2020-05-28                     LibMesh Version:         f93d79f5034b052bb180faaaa668ec7c49647187                PETSc Version:           3.11.4                                                  Current Time:            Wed Jun 10 09:53:37 2020                                Executable Timestamp:    Wed Jun 10 09:14:02 2020                                                                                                                                                                                                  ### Input File ###                                                                                                                                                []                                                                                 inactive                       = (no_default)                                    initial_from_file_timestep     = LATEST                                          initial_from_file_var          = INVALID                                         element_order                  = AUTO                                            order                          = AUTO                                            side_order                     = AUTO                                            type                           = GAUSS                                         []                                                                                                                                                                [Components]                                                                       inactive                       = (no_default)                                                                                                                     [./inlet]                                                                          inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = SolidWall                                         control_tags                 = Components                                        enable                       = 1                                                 gravity_vector               = '(x,y,z)=(       0,        0,    -9.81)'          input                        = pipe:in                                         [../]                                                                                                                                                             [./outlet]                                                                         inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = SolidWall                                         control_tags                 = Components                                        enable                       = 1                                                 gravity_vector               = '(x,y,z)=(       0,        0,    -9.81)'          input                        = pipe:out                                        [../]                                                                                                                                                             [./pipe]                                                                           inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = FlowChannel1Phase                                 A                            = 1                                                 D_h                          = INVALID                                           PoD                          = 1                                                 axial_region_names           = 'r1 r2'                                           closures                     = simple                                            control_tags                 = Components                                        enable                       = 1                                                 f                            = 0                                                 fp                           = eos                                               gravity_vector               = '(x,y,z)=(       0,        0,    -9.81)'          heat_transfer_geom           = PIPE                                              initial_T                    = 300                                               initial_p                    = 1e5                                               initial_vel                  = 0                                                 length                       = '1 1'                                             lump_mass_matrix             = 0                                                 n_elems                      = '1 2'                                             orientation                  = '(x,y,z)=(       1,        0,        0)'          pipe_pars_transferred        = 0                                                 position                     = '(x,y,z)=(       0,        0,        0)'          rdg_slope_reconstruction     = NONE                                              rotation                     = 0                                                 roughness                    = 0                                                 stabilization                = (no_default)                                    [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      auto_preconditioning           = 1                                               inactive                       = (no_default)                                    isObjectAction                 = 1                                               type                           = Transient                                       abort_on_solve_fail            = 0                                               accept_on_max_picard_iteration = 0                                               automatic_scaling              = INVALID                                         compute_initial_residual_before_preset_bcs = 0                                   compute_scaling_once           = 1                                               contact_line_search_allowed_lambda_cuts = 2                                      contact_line_search_ltol       = INVALID                                         control_tags                   = (no_default)                                    custom_abs_tol                 = 1e-50                                           custom_rel_tol                 = 1e-08                                           direct_pp_value                = 0                                               disable_picard_residual_norm_check = 0                                           dt                             = 1                                               dtmax                          = 1e+30                                           dtmin                          = 2e-14                                           enable                         = 1                                               end_time                       = 1e+30                                           l_abs_tol                      = 1e-50                                           l_max_its                      = 10000                                           l_tol                          = 1e-05                                           line_search                    = default                                         line_search_package            = petsc                                           max_xfem_update                = 4294967295                                      mffd_type                      = wp                                              n_startup_steps                = 0                                               nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-50                                           nl_div_tol                     = -1                                              nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           num_grids                      = 1                                               num_steps                      = 0                                               petsc_options                  = INVALID                                         petsc_options_iname            = INVALID                                         petsc_options_value            = INVALID                                         picard_abs_tol                 = 1e-50                                           picard_custom_pp               = INVALID                                         picard_force_norms             = 0                                               picard_max_its                 = 1                                               picard_rel_tol                 = 1e-08                                           relaxation_factor              = 1                                               relaxed_variables              = (no_default)                                    reset_dt                       = 0                                               resid_vs_jac_scaling_param     = 0                                               restart_file_base              = (no_default)                                    scaling_group_variables        = INVALID                                         scheme                         = implicit-euler                                  skip_exception_check           = 0                                               snesmf_reuse_base              = 1                                               solve_type                     = INVALID                                         splitting                      = INVALID                                         ss_check_tol                   = 1e-08                                           ss_tmin                        = 0                                               start_time                     = 0                                               steady_state_detection         = 0                                               steady_state_start_time        = 0                                               steady_state_tolerance         = 1e-08                                           time_period_ends               = INVALID                                         time_period_starts             = INVALID                                         time_periods                   = INVALID                                         timestep_tolerance             = 2e-14                                           trans_ss_check                 = 0                                               update_xfem_at_timestep_begin  = 0                                               use_multiapp_dt                = 0                                               verbose                        = 0                                             []                                                                                                                                                                [FluidProperties]                                                                                                                                                   [./eos]                                                                            inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = StiffenedGasFluidProperties                       M                            = 0                                                 T_c                          = 0                                                 allow_duplicate_execution_on_initial = 0                                         allow_imperfect_jacobians    = 0                                                 allow_nonphysical_states     = 1                                                 control_tags                 = FluidProperties                                   cv                           = 1816                                              e_c                          = 0                                                 emit_on_nan                  = none                                              enable                       = 1                                                 execute_on                   = TIMESTEP_END                                      force_preaux                 = 0                                                 force_preic                  = 0                                                 fp_type                      = single-phase-fp                                   gamma                        = 2.35                                              k                            = 0.6                                               mu                           = 0.001                                             p_inf                        = 1e+09                                             q                            = -1.167e+06                                        q_prime                      = 0                                                 rho_c                        = 0                                                 use_displaced_mesh           = 0                                               [../]                                                                          []                                                                                                                                                                [GlobalParams]                                                                     closures                       = simple                                          initial_T                      = 300                                             initial_p                      = 1e5                                             initial_vel                    = 0                                             []                                                                                                                                                                [Outputs]                                                                          append_date                    = 0                                               append_date_format             = INVALID                                         checkpoint                     = 0                                               color                          = 1                                               console                        = 1                                               controls                       = 0                                               csv                            = 0                                               dofmap                         = 0                                               execute_on                     = 'INITIAL TIMESTEP_END'                          exodus                         = 0                                               file_base                      = INVALID                                         gmv                            = 0                                               gnuplot                        = 0                                               hide                           = INVALID                                         inactive                       = (no_default)                                    interval                       = 1                                               nemesis                        = 0                                               output_if_base_contains        = INVALID                                         perf_graph                     = 0                                               print_linear_residuals         = 1                                               print_mesh_changed_info        = 0                                               print_perf_log                 = 0                                               show                           = INVALID                                         solution_history               = 0                                               sync_times                     = (no_default)                                    tecplot                        = 0                                               vtk                            = 0                                               xda                            = 0                                               xdr                            = 0                                               xml                            = 0                                                                                                                                [./out]                                                                            inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = Exodus                                            additional_execute_on        = INVALID                                           append_date                  = 0                                                 append_date_format           = INVALID                                           append_oversample            = 0                                                 control_tags                 = Outputs                                           discontinuous                = 0                                                 elemental_as_nodal           = 0                                                 enable                       = 1                                                 end_step                     = INVALID                                           end_time                     = INVALID                                           execute_elemental_on         = INVALID                                           execute_elemental_variables  = 1                                                 execute_input                = 1                                                 execute_input_on             = INITIAL                                           execute_nodal_on             = INVALID                                           execute_nodal_variables      = 1                                                 execute_on                   = 'INITIAL TIMESTEP_END'                            execute_postprocessors_on    = INVALID                                           execute_scalar_variables     = 1                                                 execute_scalars_on           = INVALID                                           execute_system_information   = 1                                                 execute_vector_postprocessors = 1                                                file                         = INVALID                                           file_base                    = phy.sub_discretization_out                        hide                         = INVALID                                           interval                     = 1                                                 linear_residual_dt_divisor   = 1000                                              linear_residual_end_time     = INVALID                                           linear_residual_start_time   = INVALID                                           linear_residuals             = 0                                                 nonlinear_residual_dt_divisor = 1000                                             nonlinear_residual_end_time  = INVALID                                           nonlinear_residual_start_time = INVALID                                          nonlinear_residuals          = 0                                                 output_dimension             = default                                           output_if_base_contains      = (no_default)                                      output_linear                = 0                                                 output_material_properties   = 0                                                 output_nonlinear             = 0                                                 output_postprocessors        = 1                                                 oversample                   = 0                                                 overwrite                    = 0                                                 padding                      = 3                                                 position                     = INVALID                                           refinements                  = 0                                                 scalar_as_nodal              = 0                                                 sequence                     = INVALID                                           show                         = A                                                 show_material_properties     = INVALID                                           start_step                   = INVALID                                           start_time                   = INVALID                                           sync_only                    = 0                                                 sync_times                   = (no_default)                                      time_tolerance               = 1e-14                                             use_displaced                = 0                                                 use_problem_dimension        = INVALID                                         [../]                                                                          []                                                                                                                                                                [Problem]                                                                          inactive                       = (no_default)                                    isObjectAction                 = 1                                               name                           = 'MOOSE Problem'                                 type                           = FEProblem                                       library_name                   = (no_default)                                    library_path                   = (no_default)                                    object_names                   = INVALID                                         register_objects_from          = INVALID                                         block                          = INVALID                                         control_tags                   = (no_default)                                    coord_type                     = XYZ                                             default_ghosting               = 0                                               enable                         = 1                                               error_on_jacobian_nonzero_reallocation = 0                                       extra_tag_matrices             = INVALID                                         extra_tag_vectors              = INVALID                                         force_restart                  = 0                                               ignore_zeros_in_jacobian       = 0                                               kernel_coverage_check          = 1                                               material_coverage_check        = 1                                               material_dependency_check      = 1                                               near_null_space_dimension      = 0                                               null_space_dimension           = 0                                               parallel_barrier_messaging     = 0                                               restart_file_base              = INVALID                                         rz_coord_axis                  = Y                                               skip_additional_restart_data   = 0                                               skip_nl_system_check           = 0                                               solve                          = 0                                               transpose_null_space_dimension = 0                                               use_nonlinear                  = 1                                             []                                                                                          ?�      ?�      ?�      