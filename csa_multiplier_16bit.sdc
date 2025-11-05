# Create clock 'clk' with 10 ns period (100 MHz)
create_clock -name clk -period 10.0 [get_ports clk]

# Set input delay of 2 ns relative to clock 'clk'
set_input_delay -clock clk 2.0 [get_ports *]

# Set output delay of 2 ns relative to clock 'clk'
set_output_delay -clock clk 2.0 [get_ports *]

# Set clock uncertainty (jitter) of 0.1 ns for 'clk'
set_clock_uncertainty 0.1 [get_clocks clk]
