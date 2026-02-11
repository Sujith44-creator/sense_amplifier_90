set_db init_lib_search_path ./lib
set_db init_hdl_search_path ./rtl
set_db library slow.lib
read_hdl saff.v
elaborate saff
create_clock -name clk -period 20 [get_ports clk]
set_clock_uncertainty 0.3 [get_clocks clk]
set_clock_transition 0.2 [get_clocks clk]
set_input_delay 2.0 -clock clk [get_ports d]
set_input_delay 1.5 -clock clk [get_ports rst]
set_input_transition 0.3 [get_ports {d rst}]
set_output_delay 2.0 -clock clk [get_ports {q qb}]
set_load 0.08 [get_ports {q qb}]
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort high
syn_generic
syn_map
syn_opt
report_timing > timing_90nm.rpt
report_area   > area_90nm.rpt
report_power  > power_90nm.rpt
write_hdl > saff_90nm_netlist.v
write_sdc > saff_90nm_constraints.sdc
