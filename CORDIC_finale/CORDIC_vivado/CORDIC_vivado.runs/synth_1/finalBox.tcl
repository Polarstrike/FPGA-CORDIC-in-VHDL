# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
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
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/nicom/Desktop/CORDIC_vivado/CORDIC_vivado.cache/wt [current_project]
set_property parent.project_path C:/Users/nicom/Desktop/CORDIC_vivado/CORDIC_vivado.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Users/nicom/Desktop/CORDIC_vivado/CORDIC_vivado.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/nicom/Desktop/CORDIC/Counter.vhd
  {C:/Users/nicom/Desktop/CORDIC/DFF_N _noReset.vhd}
  C:/Users/nicom/Desktop/CORDIC/DFF_N.vhd
  C:/Users/nicom/Desktop/CORDIC/DFF_N_en.vhd
  C:/Users/nicom/Desktop/CORDIC/Xbox.vhd
  C:/Users/nicom/Desktop/CORDIC/Ybox.vhd
  C:/Users/nicom/Desktop/CORDIC/Zbox.vhd
  C:/Users/nicom/Desktop/CORDIC/addsub_N.vhd
  C:/Users/nicom/Desktop/CORDIC/cordic_lut_16.vhd
  C:/Users/nicom/Desktop/CORDIC/fullAdder_N.vhd
  C:/Users/nicom/Desktop/CORDIC/full_adder.vhd
  C:/Users/nicom/Desktop/CORDIC/multiplier.vhd
  C:/Users/nicom/Desktop/CORDIC/mux.vhd
  C:/Users/nicom/Desktop/CORDIC/shift_i.vhd
  C:/Users/nicom/Desktop/CORDIC/finalBox.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/nicom/Desktop/CORDIC_vivado/CORDIC_vivado.srcs/constrs_1/new/constraints.xdc
set_property used_in_implementation false [get_files C:/Users/nicom/Desktop/CORDIC_vivado/CORDIC_vivado.srcs/constrs_1/new/constraints.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top finalBox -part xc7z010clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef finalBox.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file finalBox_utilization_synth.rpt -pb finalBox_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]