read netlist c3540_synth.v
read netlist $UMC_LIB/verilog_simulation_models/*.v
run build_model c3540
run drc
add faults -all
set pattern internal
run atpg
write patterns c3540_test_set.v -format verilog_single_file -nocompaction  -replace


set pattern external c3540_test_set.v
add faults -all
run fault_sim

report summaries
write faults not_detected_faults -class ND -uncollapsed


#set pattern external c1355_test_set.v
#add faults -all 
#remove faults U330
#run fault_sim

#remove faults -Module AOI32D1
