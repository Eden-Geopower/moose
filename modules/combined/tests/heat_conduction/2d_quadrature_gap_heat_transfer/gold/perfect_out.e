CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes         num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_el_in_blk2        num_nod_per_el2       num_side_ss1      num_side_ss2      num_side_ss3      num_side_ss4      num_nod_ns1       num_nod_ns2       num_nod_ns3       num_nod_ns4       num_nod_var       num_elem_var      num_info  -         api_version       @��H   version       @��H   floating_point_word_size            	file_size               title         perfect_out.e      maximum_name_length                 %   
time_whole                            n$   	eb_status                             
\   eb_prop1               name      ID              
d   	ns_status         	                    
l   ns_prop1      	         name      ID              
|   	ss_status         
                    
�   ss_prop1      
         name      ID              
�   coordx                      �      
�   coordy                      �      <   eb_names                       D      �   ns_names      	                 �         ss_names      
                 �      �   
coor_names                         D         connect1                  	elem_type         QUAD4         @      \   elem_num_map                           �   connect2                  	elem_type         QUAD4         @      �   elem_ss1                          �   side_ss1                             elem_ss2                             side_ss2                             elem_ss3                             side_ss3                          $   elem_ss4                          ,   side_ss4                          4   node_ns1                          <   node_ns2                          H   node_ns3                          T   node_ns4                          `   vals_nod_var1                          �      n,   name_nod_var                       $      l   name_elem_var                          D      �   vals_elem_var1eb1                                 n�   vals_elem_var2eb1                                 n�   vals_elem_var1eb2                                 n�   vals_elem_var2eb2                                 o   elem_var_tab                             �   info_records                      _@      �                                                            ?�              <p      ?�      ��      ��              ?�      ��      @      @       @       @      ?�      ?�      @       @      ?�      ?�      ?�      �]E�t]        ?�              ��      ��      ��      ?�      ?�      �]E�t]        ?�              ��      ��      ��      left                             right                                                                                                                                                                  leftright                        leftleft                         rightright                       rightleft                                                                                                                                         	                              
                                                                                                               	   
               temp                                gap_temp                         penetration                                    ####################                                                             # Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                   -i                                                                               perfect.i                                                                                                                                                         ### Version Info ###                                                             Framework Information:                                                           SVN Revision:            15128                                                   PETSc Version:           3.1.0                                                   Current Time:            Wed Nov 28 09:47:50 2012                                Executable Timestamp:    Wed Nov 28 09:35:34 2012                                                                                                                                                                                                  ### Input File ###                                                                                                                                                []                                                                                 initial_from_file_timestep     = 2                                               initial_from_file_var          =                                                 block                          =                                                 coord_type                     =                                                 fe_cache                       = 0                                               name                           = 'MOOSE Problem'                                 type                           = FEProblem                                       order                          = AUTO                                            active_bcs                     =                                                 active_kernels                 =                                                 inactive_bcs                   =                                                 inactive_kernels               =                                                 start                          = 0                                             []                                                                                                                                                                [AuxBCs]                                                                                                                                                            [./gap_value_0]                                                                    type                         = GapValueAux                                       block                        =                                                   boundary                     = leftright                                         execute_on                   = residual                                          order                        = FIRST                                             paired_boundary              = rightleft                                         paired_variable              = temp                                              tangential_tolerance         =                                                   variable                     = gap_temp                                          warnings                     = 0                                               [../]                                                                                                                                                             [./penetration_0]                                                                  type                         = PenetrationAux                                    block                        =                                                   boundary                     = leftright                                         execute_on                   = residual                                          order                        = FIRST                                             paired_boundary              = rightleft                                         quantity                     = distance                                          tangential_tolerance         =                                                   variable                     = penetration                                     [../]                                                                          []                                                                                                                                                                [AuxVariables]                                                                                                                                                      [./gap_temp]                                                                       block                        =                                                   family                       = MONOMIAL                                          initial_condition            = 0                                                 order                        = CONSTANT                                          scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        =                                                 [../]                                                                                                                                                             [./penetration]                                                                    block                        =                                                   family                       = MONOMIAL                                          initial_condition            = 0                                                 order                        = CONSTANT                                          scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        =                                                 [../]                                                                          []                                                                                                                                                                [BCs]                                                                                                                                                               [./gap_bc_0]                                                                       type                         = GapHeatTransfer                                   boundary                     = leftright                                         diag_save_in                 =                                                   gap_distance                 =                                                   gap_temp                     =                                                   max_gap                      = 1e+06                                             min_gap                      = 1e-06                                             order                        = FIRST                                             paired_boundary              = rightleft                                         quadrature                   = 1                                                 save_in                      =                                                   variable                     = temp                                              warnings                     = 0                                               [../]                                                                                                                                                             [./gap_bc_10000]                                                                   type                         = GapHeatTransfer                                   boundary                     = rightleft                                         diag_save_in                 =                                                   gap_distance                 =                                                   gap_temp                     =                                                   max_gap                      = 1e+06                                             min_gap                      = 1e-06                                             order                        = FIRST                                             paired_boundary              = leftright                                         quadrature                   = 1                                                 save_in                      =                                                   variable                     = temp                                              warnings                     = 0                                               [../]                                                                                                                                                             [./left]                                                                           type                         = DirichletBC                                       boundary                     = leftleft                                          value                        = 300                                               variable                     = temp                                            [../]                                                                                                                                                             [./right]                                                                          type                         = DirichletBC                                       boundary                     = rightright                                        value                        = 400                                               variable                     = temp                                            [../]                                                                          []                                                                                                                                                                [DiracKernels]                                                                                                                                                      [./thermal_master_0]                                                               type                         = GapHeatPointSourceMaster                          boundary                     = rightleft                                         order                        = FIRST                                             slave                        = leftright                                         tangential_tolerance         =                                                   variable                     = temp                                            [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      l_abs_step_tol                 = -1                                              l_max_its                      = 10000                                           l_tol                          = 1e-05                                           nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-50                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           no_fe_reinit                   = 0                                               petsc_options                  = -snes_mf_operator                               petsc_options_iname            =                                                 petsc_options_value            =                                                 scheme                         = backward-euler                                  type                           = Steady                                          _fe_problem                    = 0x7fd59b851000                                  restart_file_base              =                                               []                                                                                                                                                                [Kernels]                                                                                                                                                           [./hc]                                                                             type                         = HeatConduction                                    block                        =                                                   diag_save_in                 =                                                   save_in                      =                                                   variable                     = temp                                            [../]                                                                          []                                                                                                                                                                [Materials]                                                                                                                                                         [./gap_value_0]                                                                    gap_conductivity             = 1                                                 gap_distance                 =                                                   gap_temp                     =                                                   max_gap                      = 1e+06                                             min_gap                      = 1e-06                                             quadrature                   = 1                                                 temp                         = temp                                            [../]                                                                                                                                                             [./gap_value_10000]                                                                type                         = GapConductance                                    block                        =                                                   boundary                     = rightleft                                         gap_conductivity             = 1                                                 gap_distance                 =                                                   gap_temp                     =                                                   max_gap                      = 1e+06                                             min_gap                      = 1e-06                                             order                        = FIRST                                             paired_boundary              = leftright                                         quadrature                   = 1                                                 temp                         = temp                                              variable                     = temp                                              warnings                     = 0                                               [../]                                                                                                                                                             [./hcm]                                                                            type                         = HeatConductionMaterial                            block                        = 'left right'                                      boundary                     =                                                   specific_heat                = 1                                                 specific_heat_temperature_function =                                             temp                         =                                                   thermal_conductivity         = 1                                                 thermal_conductivity_temperature_function =                                      thermal_conductivity_x       =                                                   thermal_conductivity_y       =                                                   thermal_conductivity_z       =                                                 [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  =                                                 uniform_refine                 = 0                                               ghosted_boundaries             =                                                 ghosted_boundaries_inflation   =                                                 patch_size                     = 40                                              skip_partitioning              = 0                                               type                           = MooseMesh                                       block_id                       =                                                 block_name                     =                                                 boundary_id                    =                                                 boundary_name                  =                                                 centroid_partitioner_direction =                                                 construct_side_list_from_node_list = 0                                           partitioner                    =                                                 second_order                   = 0                                               dim                            = 3                                               file                           = perfect.e                                       nemesis                        = 0                                             []                                                                                                                                                                [Output]                                                                           elemental_as_nodal             = 0                                               exodus                         = 1                                               exodus_inputfile_output        = 1                                               file_base                      = perfect_out                                     gmv                            = 0                                               gnuplot_format                 = ps                                              interval                       = 1                                               iteration_plot_start_time      = 1.79769e+308                                    max_pps_rows_screen            = 15                                              nemesis                        = 0                                               num_restart_files              = 0                                               output_displaced               = 0                                               output_es_info                 = 1                                               output_initial                 = 1                                               output_solution_history        = 0                                               output_variables               =                                                 perf_log                       = 0                                               postprocessor_csv              = 0                                               postprocessor_gnuplot          = 0                                               postprocessor_screen           = 1                                               print_linear_residuals         = 0                                               screen_interval                = 1                                               show_setup_log_early           = 0                                               tecplot                        = 0                                               tecplot_binary                 = 0                                               xda                            = 0                                             []                                                                                                                                                                [ThermalContact]                                                                                                                                                    [./left_to_right]                                                                  disp_x                       =                                                   disp_y                       =                                                   disp_z                       =                                                   gap_type                     = GapValueAux                                       master                       = rightleft                                         order                        = FIRST                                             quadrature                   = 1                                                 save_in                      =                                                   slave                        = leftright                                         tangential_tolerance         =                                                   type                         = GapHeatTransfer                                   variable                     = temp                                              warnings                     = 0                                               [../]                                                                          []                                                                                                                                                                [Variables]                                                                                                                                                         [./temp]                                                                           block                        =                                                   family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        =                                                 [../]                                                                          []                                                                                                                                                                                                                                                                                                                                                                          ?�      @t�UUUj�@sʪ����@sʪ���@t�UUUC�@r�   3�@r�   3�@sʪ��`!@t�UUU/�@r�   3�@x�����@w�UUUA@w�UUUB�@x�����@vꪪ�Ǟ@vꪪ�K@w�UUU�@x�����@vꪪ��'@vꪪ��t        @vꪪ��9        ��              ��                                                                              