// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Oct 30 21:31:43 2024
// Host        : ProBook running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/arbeit/synchronization/RNG_Test/RNG_Test.sim/sim_1/synth/timing/xsim/TB_SimpleRX_time_synth.v
// Design      : SimpleRX
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k325tffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module SimpleRX
   (dclk_p,
    dclk_n,
    reset,
    lvds_data_p,
    lvds_data_n,
    data_out,
    dclk_internal);
  input dclk_p;
  input dclk_n;
  input reset;
  input [3:0]lvds_data_p;
  input [3:0]lvds_data_n;
  output [3:0]data_out;
  output dclk_internal;

  wire [3:0]data_out;
  wire [3:0]data_out_OBUF;
  wire dclk_internal;
  wire dclk_internal_OBUF;
  wire dclk_internal_OBUF_BUFG;
  (* IBUF_LOW_PWR = 0 *) wire dclk_n;
  (* IBUF_LOW_PWR = 0 *) wire dclk_p;
  wire [3:0]lvds_data_internal;
  (* IBUF_LOW_PWR = 0 *) wire [3:0]lvds_data_n;
  (* IBUF_LOW_PWR = 0 *) wire [3:0]lvds_data_p;
  wire reset;
  wire reset_IBUF;

initial begin
 $sdf_annotate("TB_SimpleRX_time_synth.sdf",,,,"tool_control");
end
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \data_input[0].ibufds_data 
       (.I(lvds_data_p[0]),
        .IB(lvds_data_n[0]),
        .O(lvds_data_internal[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \data_input[1].ibufds_data 
       (.I(lvds_data_p[1]),
        .IB(lvds_data_n[1]),
        .O(lvds_data_internal[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \data_input[2].ibufds_data 
       (.I(lvds_data_p[2]),
        .IB(lvds_data_n[2]),
        .O(lvds_data_internal[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \data_input[3].ibufds_data 
       (.I(lvds_data_p[3]),
        .IB(lvds_data_n[3]),
        .O(lvds_data_internal[3]));
  OBUF \data_out_OBUF[0]_inst 
       (.I(data_out_OBUF[0]),
        .O(data_out[0]));
  OBUF \data_out_OBUF[1]_inst 
       (.I(data_out_OBUF[1]),
        .O(data_out[1]));
  OBUF \data_out_OBUF[2]_inst 
       (.I(data_out_OBUF[2]),
        .O(data_out[2]));
  OBUF \data_out_OBUF[3]_inst 
       (.I(data_out_OBUF[3]),
        .O(data_out[3]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[0] 
       (.C(dclk_internal_OBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(lvds_data_internal[0]),
        .Q(data_out_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[1] 
       (.C(dclk_internal_OBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(lvds_data_internal[1]),
        .Q(data_out_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[2] 
       (.C(dclk_internal_OBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(lvds_data_internal[2]),
        .Q(data_out_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[3] 
       (.C(dclk_internal_OBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(lvds_data_internal[3]),
        .Q(data_out_OBUF[3]));
  BUFG dclk_internal_OBUF_BUFG_inst
       (.I(dclk_internal_OBUF),
        .O(dclk_internal_OBUF_BUFG));
  OBUF dclk_internal_OBUF_inst
       (.I(dclk_internal_OBUF_BUFG),
        .O(dclk_internal));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    ibufds_dclk
       (.I(dclk_p),
        .IB(dclk_n),
        .O(dclk_internal_OBUF));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
