define_design_lib WORK -path ./WORK

analyze -library WORK -format vhdl ../src/keccak_globals.vhd
analyze -library WORK -format vhdl ../src/Keccak_2to1mux.vhd
analyze -library WORK -format vhdl ../src/keccak_buffer.vhd
analyze -library WORK -format vhdl ../src/Keccak_REG_rst_n.vhd
analyze -library WORK -format vhdl ../src/keccak_round_constants_gen.vhd
analyze -library WORK -format vhdl ../src/keccak_round.vhd 
analyze -library WORK -format vhdl ../src/keccak.vhd

set power_preserve_rtl_hier_names true

elaborate keccak -architecture RTL -library WORK > elaborate.txt

uniquify
link

create_clock -name my_clk -period 2.8 {clk}
set_dont_touch_network my_clk
set_clock_uncertainty 0.07 [get_clock my_clk]
set_input_delay 0.5 -max -clock my_clk [remove_from_collection [all_inputs] clk]
set_output_delay 0.5 -max -clock my_clk [all_outputs]
set OLOAD [load_of uk65lscllmvbbr_090c125_wc/BUFM14R/A]
set_load $OLOAD [all_outputs]
compile
report_timing > results/report_timing3.txt
report_area > results/report_area3.txt
report_power > results/report_power3.txt


