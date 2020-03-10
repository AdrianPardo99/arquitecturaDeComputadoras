# 
# Report generation script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  set_param chipscope.maxJobs 1
  create_project -in_memory -part xc7a100tcsg324-1
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/practica1/sumadorNFor/sumadorNFor.cache/wt [current_project]
  set_property parent.project_path /media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/practica1/sumadorNFor/sumadorNFor.xpr [current_project]
  set_property ip_output_repo /media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/practica1/sumadorNFor/sumadorNFor.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet /media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/practica1/sumadorNFor/sumadorNFor.runs/synth_1/sumadorNBits.dcp
  read_xdc /media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/practica1/sumadorNFor/sumadorNFor.srcs/constrs_1/new/pinesPractica1.xdc
  link_design -top sumadorNBits -part xc7a100tcsg324-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force sumadorNBits_opt.dcp
  create_report "impl_1_opt_report_drc_0" "report_drc -file sumadorNBits_drc_opted.rpt -pb sumadorNBits_drc_opted.pb -rpx sumadorNBits_drc_opted.rpx"
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  if { [llength [get_debug_cores -quiet] ] > 0 }  { 
    implement_debug_core 
  } 
  place_design 
  write_checkpoint -force sumadorNBits_placed.dcp
  create_report "impl_1_place_report_io_0" "report_io -file sumadorNBits_io_placed.rpt"
  create_report "impl_1_place_report_utilization_0" "report_utilization -file sumadorNBits_utilization_placed.rpt -pb sumadorNBits_utilization_placed.pb"
  create_report "impl_1_place_report_control_sets_0" "report_control_sets -verbose -file sumadorNBits_control_sets_placed.rpt"
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step phys_opt_design
set ACTIVE_STEP phys_opt_design
set rc [catch {
  create_msg_db phys_opt_design.pb
  phys_opt_design 
  write_checkpoint -force sumadorNBits_physopt.dcp
  close_msg_db -file phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed phys_opt_design
  return -code error $RESULT
} else {
  end_step phys_opt_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force sumadorNBits_routed.dcp
  create_report "impl_1_route_report_drc_0" "report_drc -file sumadorNBits_drc_routed.rpt -pb sumadorNBits_drc_routed.pb -rpx sumadorNBits_drc_routed.rpx"
  create_report "impl_1_route_report_methodology_0" "report_methodology -file sumadorNBits_methodology_drc_routed.rpt -pb sumadorNBits_methodology_drc_routed.pb -rpx sumadorNBits_methodology_drc_routed.rpx"
  create_report "impl_1_route_report_power_0" "report_power -file sumadorNBits_power_routed.rpt -pb sumadorNBits_power_summary_routed.pb -rpx sumadorNBits_power_routed.rpx"
  create_report "impl_1_route_report_route_status_0" "report_route_status -file sumadorNBits_route_status.rpt -pb sumadorNBits_route_status.pb"
  create_report "impl_1_route_report_timing_summary_0" "report_timing_summary -max_paths 10 -file sumadorNBits_timing_summary_routed.rpt -pb sumadorNBits_timing_summary_routed.pb -rpx sumadorNBits_timing_summary_routed.rpx -warn_on_violation "
  create_report "impl_1_route_report_incremental_reuse_0" "report_incremental_reuse -file sumadorNBits_incremental_reuse_routed.rpt"
  create_report "impl_1_route_report_clock_utilization_0" "report_clock_utilization -file sumadorNBits_clock_utilization_routed.rpt"
  create_report "impl_1_route_report_bus_skew_0" "report_bus_skew -warn_on_violation -file sumadorNBits_bus_skew_routed.rpt -pb sumadorNBits_bus_skew_routed.pb -rpx sumadorNBits_bus_skew_routed.rpx"
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force sumadorNBits_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force sumadorNBits.mmi }
  write_bitstream -force sumadorNBits.bit 
  catch {write_debug_probes -quiet -force sumadorNBits}
  catch {file copy -force sumadorNBits.ltx debug_nets.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

