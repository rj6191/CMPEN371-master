
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Lab04_kjb5568_rjl5336 -dir "E:/Lab04/Lab04_kjb5568_rjl5336/planAhead_run_2" -part xc7a100tcsg324-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/Lab04/Lab04_kjb5568_rjl5336/lab04_kjb5568_rjl5336.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/Lab04/Lab04_kjb5568_rjl5336} }
set_property target_constrs_file "Nexys4_Master.ucf" [current_fileset -constrset]
add_files [list {Nexys4_Master.ucf}] -fileset [get_property constrset [current_run]]
link_design
