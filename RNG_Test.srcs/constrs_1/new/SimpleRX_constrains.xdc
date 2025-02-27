

# Настройки для LVDS данных
set_property IOSTANDARD LVDS_25 [get_ports {lvds_data_p[0]}]
set_property PACKAGE_PIN G19 [get_ports {lvds_data_p[0]}]
set_property PACKAGE_PIN F20 [get_ports {lvds_data_n[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {lvds_data_n[0]}]

set_property IOSTANDARD LVDS_25 [get_ports {lvds_data_p[1]}]
set_property PACKAGE_PIN F19 [get_ports {lvds_data_p[1]}]
set_property PACKAGE_PIN E20 [get_ports {lvds_data_n[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {lvds_data_n[1]}]

set_property IOSTANDARD LVDS_25 [get_ports {lvds_data_p[2]}]
set_property PACKAGE_PIN H19 [get_ports {lvds_data_p[2]}]
set_property PACKAGE_PIN G20 [get_ports {lvds_data_n[2]}]
set_property IOSTANDARD LVDS_25 [get_ports {lvds_data_n[2]}]

set_property IOSTANDARD LVDS_25 [get_ports {lvds_data_p[3]}]
set_property PACKAGE_PIN K20 [get_ports {lvds_data_p[3]}]
set_property PACKAGE_PIN J20 [get_ports {lvds_data_n[3]}]
set_property IOSTANDARD LVDS_25 [get_ports {lvds_data_n[3]}]

# Настройки для выходных данных
set_property PACKAGE_PIN E16 [get_ports {data_out[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_out[0]}]

set_property PACKAGE_PIN M17 [get_ports {data_out[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_out[1]}]

set_property PACKAGE_PIN L19 [get_ports {data_out[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_out[2]}]

set_property PACKAGE_PIN E15 [get_ports {data_out[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_out[3]}]

set_property IOSTANDARD LVCMOS15 [get_ports led]
set_property DRIVE 12 [get_ports led]
set_property PACKAGE_PIN W10 [get_ports led]


# Настройки для сигнала сброса

# Настройки для сигнала сброса
set_property PACKAGE_PIN D19 [get_ports resetn]
set_property IOSTANDARD LVCMOS25 [get_ports resetn]

# dclk_LVDS

set_property PACKAGE_PIN E18 [get_ports dclk_p]
set_property PACKAGE_PIN D18 [get_ports dclk_n]
set_property IOSTANDARD LVDS_25 [get_ports dclk_p]
set_property IOSTANDARD LVDS_25 [get_ports dclk_n]


set_property DIFF_TERM TRUE [get_ports dclk_n]
set_property DIFF_TERM TRUE [get_ports dclk_p]

set_property DIFF_TERM TRUE [get_ports {lvds_data_p[3]}]
set_property DIFF_TERM TRUE [get_ports {lvds_data_n[3]}]
set_property DIFF_TERM TRUE [get_ports {lvds_data_p[2]}]
set_property DIFF_TERM TRUE [get_ports {lvds_data_n[2]}]
set_property DIFF_TERM TRUE [get_ports {lvds_data_p[1]}]
set_property DIFF_TERM TRUE [get_ports {lvds_data_n[1]}]
set_property DIFF_TERM TRUE [get_ports {lvds_data_p[0]}]
set_property DIFF_TERM TRUE [get_ports {lvds_data_n[0]}]



create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_wiz_2_inst/inst/dclk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 4 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {data_out_OBUF[0]} {data_out_OBUF[1]} {data_out_OBUF[2]} {data_out_OBUF[3]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets dclk_out1]
