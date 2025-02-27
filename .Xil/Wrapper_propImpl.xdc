set_property SRC_FILE_INFO {cfile:d:/MIEM_Git_Repo/synchronization/SFP_DATA_Test_A/SFP_DATA_Test_A.gen/sources_1/ip/clk_wiz/clk_wiz.xdc rfile:../../SFP_DATA_Test_A/SFP_DATA_Test_A.gen/sources_1/ip/clk_wiz/clk_wiz.xdc id:1 order:EARLY scoped_inst:PLL/inst} [current_design]
current_instance PLL/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1_p]] 0.100
