set_property PACKAGE_PIN W5 [get_ports CLK]
	set_property IOSTANDARD LVCMOS33 [get_ports CLK]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]

set_property PACKAGE_PIN V17 [get_ports RESET]
	set_property IOSTANDARD LVCMOS33 [get_ports RESET]

set_property PACKAGE_PIN U18 [get_ports BTN_STOP]
	set_property IOSTANDARD LVCMOS33 [get_ports BTN_STOP]
	set_property PULLDOWN true [get_ports BTN_STOP]

set_property PACKAGE_PIN J1 [get_ports N_GREEN]
	set_property IOSTANDARD LVCMOS33 [get_ports N_GREEN]

set_property PACKAGE_PIN L2 [get_ports N_YELLOW]
	set_property IOSTANDARD LVCMOS33 [get_ports N_YELLOW]

set_property PACKAGE_PIN J2 [get_ports S_GREEN]
	set_property IOSTANDARD LVCMOS33 [get_ports S_GREEN]

set_property PACKAGE_PIN G2 [get_ports S_YELLOW]
	set_property IOSTANDARD LVCMOS33 [get_ports S_YELLOW]

set_property PACKAGE_PIN H1 [get_ports E_GREEN]
	set_property IOSTANDARD LVCMOS33 [get_ports E_GREEN]

set_property PACKAGE_PIN K2 [get_ports E_YELLOW]
	set_property IOSTANDARD LVCMOS33 [get_ports E_YELLOW]

set_property PACKAGE_PIN H2 [get_ports W_GREEN]
	set_property IOSTANDARD LVCMOS33 [get_ports W_GREEN]

set_property PACKAGE_PIN G3 [get_ports W_YELLOW]
	set_property IOSTANDARD LVCMOS33 [get_ports W_YELLOW]

set_property PACKAGE_PIN A14 [get_ports OUT_STOP_LIGHT]
	set_property IOSTANDARD LVCMOS33 [get_ports OUT_STOP_LIGHT]
set_property PACKAGE_PIN A16 [get_ports OUT_MODE_INDICATOR]
	set_property IOSTANDARD LVCMOS33 [get_ports OUT_MODE_INDICATOR]

set_property PACKAGE_PIN K17 [get_ports OUT_BUZZER]
	set_property IOSTANDARD LVCMOS33 [get_ports OUT_BUZZER]

set_property PACKAGE_PIN M18 [get_ports ARDUINO_ALERT]
	set_property IOSTANDARD LVCMOS33 [get_ports ARDUINO_ALERT]
	set_property PULLDOWN true [get_ports ARDUINO_ALERT]

set_property PACKAGE_PIN W7 [get_ports {seg[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]