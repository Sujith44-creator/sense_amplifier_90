
create_clock -name clk \
             -period 10 \
             [get_ports clk]
set_clock_uncertainty 0.2 [get_clocks clk]
set_clock_transition 0.1 [get_clocks clk]
set_input_delay 1.5 -clock clk [get_ports d]
set_input_delay 1.0 -clock clk [get_ports rst]
set_input_transition 0.2 [get_ports {d rst}]
set_driving_cell -lib_cell INVX1 [get_ports {d rst}]
set_output_delay 1.5 -clock clk [get_ports {q qb}]
set_load 0.05 [get_ports {q qb}]
set_operating_conditions -process typical \
                         -voltage 1.0 \
                         -temperature 25
