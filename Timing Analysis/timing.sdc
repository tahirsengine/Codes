create_clock -period 83  [get_ports clka]
create_clock -period 42  [get_ports clkb]
set_max_delay 7.0 -from [get_ports {d[*]}] -to [get_ports {q[*]}] 
set_false_path -from [get_clocks clka] -to [get_clocks clkb]