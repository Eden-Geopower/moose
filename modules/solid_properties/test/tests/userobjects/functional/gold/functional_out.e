CDF      
      len_name      	time_step          num_dim       	num_nodes      	   num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_side_ss1      num_side_ss2      num_side_ss3      num_side_ss4      num_nod_ns1       num_nod_ns2       num_nod_ns3       num_nod_ns4       num_nod_var       num_elem_var      num_info  m   len_line   Q         api_version       A   version       A   floating_point_word_size            	file_size               maximum_name_length              int64_status             title         functional_out.e          $   
time_whole                            ��   	eb_status                             
x   eb_prop1               name      ID              
|   	ns_status                             
�   ns_prop1               name      ID              
�   	ss_status                             
�   ss_prop1               name      ID              
�   coordx                      H      
�   coordy                      H         eb_names                   
_FillValue                        P   ns_names                   
_FillValue                        P   ss_names                   
_FillValue                        P   
coor_names                     
_FillValue                        P   node_num_map                    $      P   connect1         	         	elem_type         QUAD4         @      t   elem_num_map                          �   elem_ss1      
                    �   side_ss1      
                    �   elem_ss2                          �   side_ss2                          �   elem_ss3                          �   side_ss3                          �   elem_ss4                          �   side_ss4                          �   node_ns1                             node_ns2                             node_ns3                             node_ns4                          (   name_nod_var                   
_FillValue                        4   vals_nod_var1                          H      ��   name_elem_var                      
_FillValue                        4   vals_elem_var1eb1                                 �   vals_elem_var2eb1                                 �0   vals_elem_var3eb1                                 �P   elem_var_tab                             4   info_records                      s�      @                                                                 ?�      ?�              ?�      ?�      ?�              ?�                      ?�      ?�              ?�      ?�      ?�      ?�                                                                                                                                                                                                                                                                      bottom                                                                                                                                                                                                                                                          right                                                                                                                                                                                                                                                           top                                                                                                                                                                                                                                                             left                                                                                                                                                                                                                                                            bottom                                                                                                                                                                                                                                                          left                                                                                                                                                                                                                                                            right                                                                                                                                                                                                                                                           top                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	                                             	                                                                                 	         	         u                                                                                                                                                                                                                                                               density                                                                                                                                                                                                                                                         specific_heat                                                                                                                                                                                                                                                   thermal_conductivity                                                                                                                                                                                                                                                     #################### �@     An�   An�   An�   An�   @z�2��@z�2��@z�2# Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                    /home/anovak/moose/modules/solid_properties/solid_properties-opt -i function... al.i### Version Info ###                                                         Framework Information:                                                           MOOSE Version:           git commit f43c04cd19 on 2022-08-02                     LibMesh Version:         4747096de5d6c69ed79f28e38ce45c76546364c3                PETSc Version:           3.16.5                                                  SLEPc Version:           3.16.2                                                  Current Time:            Tue Aug  2 12:28:49 2022                                Executable Timestamp:    Tue Aug  2 11:58:09 2022                                                                                                                                                                                                  ### Input File ###                                                                                                                                                []                                                                                 inactive                       = (no_default)                                    initial_from_file_timestep     = LATEST                                          initial_from_file_var          = INVALID                                         allow_negative_qweights        = 1                                               custom_blocks                  = (no_default)                                    custom_orders                  = (no_default)                                    element_order                  = AUTO                                            order                          = AUTO                                            side_order                     = AUTO                                            type                           = GAUSS                                         []                                                                                                                                                                [BCs]                                                                                                                                                               [./left]                                                                           inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = DirichletBC                                       boundary                     = left                                              control_tags                 = BCs                                               diag_save_in                 = INVALID                                           displacements                = INVALID                                           enable                       = 1                                                 extra_matrix_tags            = INVALID                                           extra_vector_tags            = INVALID                                           implicit                     = 1                                                 matrix_tags                  = 'system time'                                     preset                       = 1                                                 save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 value                        = 1000                                              variable                     = u                                                 vector_tags                  = residual                                        [../]                                                                                                                                                             [./right]                                                                          inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = DirichletBC                                       boundary                     = right                                             control_tags                 = BCs                                               diag_save_in                 = INVALID                                           displacements                = INVALID                                           enable                       = 1                                                 extra_matrix_tags            = INVALID                                           extra_vector_tags            = INVALID                                           implicit                     = 1                                                 matrix_tags                  = 'system time'                                     preset                       = 1                                                 save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 value                        = 500                                               variable                     = u                                                 vector_tags                  = residual                                        [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      auto_preconditioning           = 1                                               inactive                       = (no_default)                                    isObjectAction                 = 1                                               type                           = Steady                                          accept_on_max_fixed_point_iteration = 0                                          accept_on_max_picard_iteration = 0                                               auto_advance                   = INVALID                                         automatic_scaling              = INVALID                                         compute_initial_residual_before_preset_bcs = 0                                   compute_scaling_once           = 1                                               contact_line_search_allowed_lambda_cuts = 2                                      contact_line_search_ltol       = INVALID                                         control_tags                   = (no_default)                                    custom_abs_tol                 = 1e-50                                           custom_pp                      = INVALID                                         custom_rel_tol                 = 1e-08                                           direct_pp_value                = 0                                               disable_fixed_point_residual_norm_check = 0                                      disable_picard_residual_norm_check = 0                                           enable                         = 1                                               fixed_point_abs_tol            = 1e-50                                           fixed_point_algorithm          = picard                                          fixed_point_force_norms        = 0                                               fixed_point_max_its            = 1                                               fixed_point_min_its            = 1                                               fixed_point_rel_tol            = 1e-08                                           ignore_variables_for_autoscaling = INVALID                                       l_abs_tol                      = 1e-50                                           l_max_its                      = 10000                                           l_tol                          = 1e-05                                           line_search                    = default                                         line_search_package            = petsc                                           max_xfem_update                = 4294967295                                      mffd_type                      = wp                                              n_max_nonlinear_pingpong       = 100                                             nl_abs_div_tol                 = 1e+50                                           nl_abs_step_tol                = 0                                               nl_abs_tol                     = 1e-50                                           nl_div_tol                     = 1e+10                                           nl_forced_its                  = 0                                               nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 0                                               nl_rel_tol                     = 1e-08                                           num_grids                      = 1                                               off_diagonals_in_auto_scaling  = 0                                               outputs                        = INVALID                                         petsc_options                  = INVALID                                         petsc_options_iname            = INVALID                                         petsc_options_value            = INVALID                                         picard_abs_tol                 = 1e-50                                           picard_custom_pp               = INVALID                                         picard_force_norms             = 0                                               picard_max_its                 = 1                                               picard_rel_tol                 = 1e-08                                           relaxation_factor              = 1                                               relaxed_variables              = (no_default)                                    resid_vs_jac_scaling_param     = 0                                               residual_and_jacobian_together = 0                                               restart_file_base              = (no_default)                                    scaling_group_variables        = INVALID                                         skip_exception_check           = 0                                               snesmf_reuse_base              = 1                                               solve_type                     = INVALID                                         splitting                      = INVALID                                         time                           = 0                                               transformed_postprocessors     = (no_default)                                    transformed_variables          = (no_default)                                    update_xfem_at_timestep_begin  = 0                                               verbose                        = 0                                             []                                                                                                                                                                [Kernels]                                                                                                                                                           [./diff]                                                                           inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = Diffusion                                         block                        = INVALID                                           control_tags                 = Kernels                                           diag_save_in                 = INVALID                                           displacements                = INVALID                                           enable                       = 1                                                 extra_matrix_tags            = INVALID                                           extra_vector_tags            = INVALID                                           implicit                     = 1                                                 matrix_tags                  = system                                            prop_getter_suffix           = (no_default)                                      save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = u                                                 vector_tags                  = nontime                                         [../]                                                                          []                                                                                                                                                                [Materials]                                                                                                                                                         [./sp_mat]                                                                         inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = ThermalSolidPropertiesMaterial                    block                        = INVALID                                           boundary                     = INVALID                                           compute                      = 1                                                 constant_on                  = NONE                                              control_tags                 = Materials                                         declare_suffix               = (no_default)                                      density                      = density                                           enable                       = 1                                                 implicit                     = 1                                                 output_properties            = 'thermal_conductivity density specific_heat'      outputs                      = exodus                                            prop_getter_suffix           = (no_default)                                      seed                         = 0                                                 sp                           = func                                              specific_heat                = specific_heat                                     temperature                  = u                                                 thermal_conductivity         = thermal_conductivity                              use_displaced_mesh           = 0                                               [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  = INVALID                                         inactive                       = (no_default)                                    use_displaced_mesh             = 1                                               include_local_in_ghosting      = 0                                               output_ghosting                = 0                                               block_id                       = INVALID                                         block_name                     = INVALID                                         boundary_id                    = INVALID                                         boundary_name                  = INVALID                                         construct_side_list_from_node_list = 0                                           ghosted_boundaries             = INVALID                                         ghosted_boundaries_inflation   = INVALID                                         isObjectAction                 = 1                                               second_order                   = 0                                               skip_deletion_repartition_after_refine = 0                                       skip_partitioning              = 0                                               type                           = FileMesh                                        uniform_refine                 = 0                                               allow_renumbering              = 1                                               build_all_side_lowerd_mesh     = 0                                               centroid_partitioner_direction = INVALID                                         construct_node_list_from_side_list = 1                                           control_tags                   = INVALID                                         dim                            = 1                                               enable                         = 1                                               final_generator                = INVALID                                         ghosting_patch_size            = INVALID                                         max_leaf_size                  = 10                                              nemesis                        = 0                                               parallel_type                  = DEFAULT                                         partitioner                    = default                                         patch_size                     = 40                                              patch_update_strategy          = never                                           skip_refine_when_use_split     = 1                                                                                                                                [./mesh]                                                                           inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = GeneratedMeshGenerator                            bias_x                       = 1                                                 bias_y                       = 1                                                 bias_z                       = 1                                                 boundary_id_offset           = 0                                                 boundary_name_prefix         = INVALID                                           control_tags                 = Mesh                                              dim                          = 2                                                 elem_type                    = INVALID                                           enable                       = 1                                                 extra_element_integers       = INVALID                                           gauss_lobatto_grid           = 0                                                 nx                           = 2                                                 ny                           = 2                                                 nz                           = 1                                                 show_info                    = 0                                                 subdomain_ids                = INVALID                                           xmax                         = 1                                                 xmin                         = 0                                                 ymax                         = 1                                                 ymin                         = 0                                                 zmax                         = 1                                                 zmin                         = 0                                               [../]                                                                          []                                                                                                                                                                [Mesh]                                                                                                                                                              [./mesh]                                                                         [../]                                                                          []                                                                                                                                                                [Mesh]                                                                                                                                                              [./mesh]                                                                         [../]                                                                          []                                                                                                                                                                [Modules]                                                                                                                                                           [./SolidProperties]                                                                                                                                                 [./func]                                                                           inactive                   = (no_default)                                        isObjectAction             = 1                                                   type                       = ThermalFunctionSolidProperties                      allow_duplicate_execution_on_initial = 0                                         allow_imperfect_jacobians  = 0                                                   control_tags               = Modules/SolidProperties                             cp                         = 200*t+150.0                                         enable                     = 1                                                   execute_on                 = TIMESTEP_END                                        force_postaux              = 0                                                   force_preaux               = 0                                                   force_preic                = 0                                                   k                          = 2.0*exp(-100.0/(2.0+t))+1.0                         prop_getter_suffix         = (no_default)                                        rho                        = 1000.0                                              use_displaced_mesh         = 0                                                 [../]                                                                          [../]                                                                          []                                                                                                                                                                [Outputs]                                                                          append_date                    = 0                                               append_date_format             = INVALID                                         checkpoint                     = 0                                               color                          = 1                                               console                        = 1                                               controls                       = 0                                               csv                            = 0                                               dofmap                         = 0                                               execute_on                     = 'INITIAL TIMESTEP_END'                          exodus                         = 1                                               file_base                      = INVALID                                         gmv                            = 0                                               gnuplot                        = 0                                               hide                           = INVALID                                         inactive                       = (no_default)                                    interval                       = 1                                               json                           = 0                                               nemesis                        = 0                                               output_if_base_contains        = INVALID                                         perf_graph                     = 0                                               perf_graph_live                = 1                                               perf_graph_live_mem_limit      = 100                                             perf_graph_live_time_limit     = 5                                               print_linear_converged_reason  = 1                                               print_linear_residuals         = 1                                               print_mesh_changed_info        = 0                                               print_nonlinear_converged_reason = 1                                             print_perf_log                 = 0                                               show                           = INVALID                                         solution_history               = 0                                               sync_times                     = (no_default)                                    tecplot                        = 0                                               vtk                            = 0                                               xda                            = 0                                               xdr                            = 0                                               xml                            = 0                                             []                                                                                                                                                                [Variables]                                                                                                                                                         [./u]                                                                              family                       = LAGRANGE                                          inactive                     = (no_default)                                      initial_condition            = 1000                                              isObjectAction               = 1                                                 order                        = FIRST                                             scaling                      = INVALID                                           type                         = MooseVariableBase                                 initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                           array                        = 0                                                 block                        = INVALID                                           components                   = 1                                                 control_tags                 = Variables                                         eigen                        = 0                                                 enable                       = 1                                                 fv                           = 0                                                 outputs                      = INVALID                                           use_dual                     = 0                                               [../]                                                                          []                                                                                          @�@     @�@     @�@     @�@     @�@     @�@     @�@     @�@     @�@     @�@     @�@     @�@     @�@     An�   An�   An�   An�   @z�2��@z�2��@z�2��@z�2��?�      @�@     @�p    @�p    @�@     @@     @@     @�p    @�@     @@     @�@     @�@     @�@     @�@     Aap   @���   Aap   @���   @C�{��@�K�Â�@C�{��@�K�Â�