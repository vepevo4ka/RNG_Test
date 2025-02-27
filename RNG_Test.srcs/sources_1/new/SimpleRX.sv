`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Create Date: 01.10.2024 23:53:39
// Design Name: 
// Module Name: SimpleRX
// Project Name: QKD
// Target Devices: XC7K325TFFG676-2
// Tool Versions: Vivado 2021.2
// Description: RNG Testing Module
// 
//////////////////////////////////////////////////////////////////////////////////

module SimpleRX(

    input logic        resetn,       // Reset signal
    input logic [3:0]  lvds_data_p, // 4-битные LVDS data positive signals
    input logic [3:0]  lvds_data_n, // 4-битные LVDS data negative signals
    input logic        dclk_p,
    input logic        dclk_n,
    output logic [3:0] data_out,    // Output data
    output logic       led        
);

    // Однополярные сигналы после буферизации
    logic [3:0]  lvds_data_internal;
    logic        dclk_out1;
    logic [26:0] dclk_divider;
    logic        divided_clk;
                                            

    clk_wiz_2 clk_wiz_2_inst (                                              
        .clk_in1_p (dclk_p),                                      
        .clk_in1_n (dclk_n),  
        .dclk_out1 (dclk_out1),                              
        .resetn(resetn),          // Active low reset            
        .locked()                 // »ндикатор блокировки        
  );                                                            

always_ff @(posedge dclk_out1 or negedge resetn) begin
    if (!resetn) begin 
        dclk_divider <= '0;
    end else begin
        dclk_divider <= dclk_divider + 1'b1;
    end
end

  assign led = dclk_divider[26]; 
  
        
    
    // Буферизация дифференциальных входных данных
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : data_input
            IBUFDS #(
                .DIFF_TERM("TRUE"),
                .IBUF_LOW_PWR("FALSE")
            ) ibufds_data (
                .I(lvds_data_p[i]),
                .IB(lvds_data_n[i]),
                .O(lvds_data_internal[i])
            );
        end
    endgenerate

    // Процесс захвата данных на фронте внутреннего тактового сигнала
    always_ff @(posedge dclk_out1 or negedge resetn) begin
        if (!resetn) begin
            data_out <= 4'b0; // Сброс выхода данных в 0
        end else begin
            data_out <= lvds_data_internal; // Захват входных данных
        end
    end
endmodule

