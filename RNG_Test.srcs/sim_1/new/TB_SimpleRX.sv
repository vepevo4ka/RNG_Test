`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Create Date: 02.10.2024 15:36:59
// Design Name: 
// Module Name: TB_SimpleRX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Тестируем самый простой lvds

// 
//////////////////////////////////////////////////////////////////////////////////

//input signals for UUT
module TB_SimpleRX;
    reg dclk_p;
    reg dclk_n;
    reg reset;
    reg [3:0] lvds_data_p;
    reg [3:0] lvds_data_n;

//output signals for UUT  
    wire [3:0] data_out;
    wire dclk_internal;

    // Instantiate the LVDS receiver module
    SimpleRX uut (
    .dclk_p(dclk_p),
    .dclk_n(dclk_n),
    .reset(reset),
    .lvds_data_p(lvds_data_p),
    .lvds_data_n(lvds_data_n),
    .data_out(data_out),
    .dclk_internal(dclk_internal)    
    );  
        
    // Clock generation
    initial begin
        dclk_p = 0;
        dclk_n = 1; // Инвертированный сигнал
        forever #10 begin
            dclk_p = ~dclk_p;
            dclk_n = ~dclk_n;
        end
    end
    
    // Test procedure
    initial begin
        // Initialize signals

        reset = 1;
        lvds_data_p = 4'b0000;
        lvds_data_n = 4'b0000;
        #10 reset = 0;    

 
         
        // Apply test vectors
        // Apply test vectors
        #10 lvds_data_p = 4'b1010; lvds_data_n = 4'b0101;  // 20 ns: 10 > 5
        #10 lvds_data_p = 4'b1100; lvds_data_n = 4'b0011;  // 30 ns: 12 > 3
        #10 lvds_data_p = 4'b1111; lvds_data_n = 4'b0000;  // 40 ns: 15 > 0
        #10 lvds_data_p = 4'b0110; lvds_data_n = 4'b1001;  // 50 ns: 6 < 9
        #10 lvds_data_p = 4'b0101; lvds_data_n = 4'b0101;  // 60 ns: 5 == 5
        #10 lvds_data_p = 4'b0011; lvds_data_n = 4'b1000;  // 70 ns: 3 < 8
        #10 lvds_data_p = 4'b1110; lvds_data_n = 4'b1110;  // 80 ns: 14 == 14
        #10 lvds_data_p = 4'b1001; lvds_data_n = 4'b0110;  // 90 ns: 9 > 6
        #10 lvds_data_p = 4'b0001; lvds_data_n = 4'b0010;  // 100 ns: 1 < 2
        #10 lvds_data_p = 4'b1000; lvds_data_n = 4'b1000;  // 110 ns: 8 == 8
        #10 lvds_data_p = 4'b0010; lvds_data_n = 4'b0001;  // 120 ns: 2 > 1
        
        #1000 $finish;  // End simulation after 1000 ns
    end
       
    // Monitor output signals
    initial begin
    $monitor("Time = %t | reset = %b | dclk_p = %b | dclk_n = %b | dclk_internal = %b | lvds_data_p = %b | lvds_data_n = %b | data_out = %b", 
             $time, reset, dclk_p, dclk_n, dclk_internal, lvds_data_p, lvds_data_n, data_out);
    end
endmodule

