set projDir "C:/Users/aikho/Desktop/alchitry-fpga-keypad-test/work/vivado"
set projName "Test Keypad"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/aikho/Desktop/alchitry-fpga-keypad-test/work/verilog/au_top_0.v" "C:/Users/aikho/Desktop/alchitry-fpga-keypad-test/work/verilog/reset_conditioner_1.v" "C:/Users/aikho/Desktop/alchitry-fpga-keypad-test/work/verilog/custom_clock_2.v" "C:/Users/aikho/Desktop/alchitry-fpga-keypad-test/work/verilog/ws2812b_writer_3.v" "C:/Users/aikho/Desktop/alchitry-fpga-keypad-test/work/verilog/wave_4.v" "C:/Users/aikho/Desktop/alchitry-fpga-keypad-test/work/verilog/keypadDriver_5.v" "C:/Users/aikho/Desktop/alchitry-fpga-keypad-test/work/verilog/alternating_Decoder_6.v" "C:/Users/aikho/Desktop/alchitry-fpga-keypad-test/work/verilog/counter_7.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/aikho/Desktop/alchitry-fpga-keypad-test/work/constraint/custom.xdc" "C:/Users/aikho/Desktop/alchitry-fpga-keypad-test/constraint/newConstraints.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
