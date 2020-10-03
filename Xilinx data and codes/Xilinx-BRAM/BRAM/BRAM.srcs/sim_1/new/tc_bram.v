`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2020 10:40:50 AM
// Design Name: 
// Module Name: tc_bram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tc_bram();
reg clka;
reg rsta;
reg wea;
reg [2:0]addra;
reg [7:0]dina;
wire [7:0] douta;

top_BRAM your_instance_name (
                            .clka(clka),            // input wire clka
                            .rsta(rsta),            // input wire rsta
                            .wea(wea),              // input wire [0 : 0] wea
                            .addra(addra),          // input wire [2 : 0] addra
                            .dina(dina),            // input wire [7 : 0] dina
                            .douta(douta));
  
  
 initial begin 
 clka = 1'b0;
 rsta = 1'b1;
 addra = 3'd0;
 dina  = 8'hFF;
 wea   = 1'b1;   // This means Write starts
 #4;
 rsta = 1'b0;
 #10;
 addra = 3'd1;
 dina  = 8'hEE;
 #4;
 addra = 3'd2;
 dina  = 8'hDD;
 #4;
 addra = 3'd3;
 dina  = 8'hCC;
 #4;
 wea   = 1'b0; // This means the Read starts
 addra = 3'd0;
 #4;
 addra = 3'd1;
 #4;
 addra = 3'd2;
 #4;
 addra = 3'd3;
  #4;
 addra = 3'd4;
  #4;
  $stop;
 end
 always #1 clka = ~clka;
endmodule
