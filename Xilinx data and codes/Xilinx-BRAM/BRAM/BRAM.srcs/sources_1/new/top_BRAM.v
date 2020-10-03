`timescale 1ns / 1ps

module top_BRAM(clka,rsta,wea, addra,dina,douta);
input clka;
input rsta;
input wea;
input  [2:0] addra;
input  [7:0] dina;
output [7:0] douta;

blk_mem_gen_0   haha             (
                                  .clka(clka),            // input wire clka
                                  .rsta(rsta),            // input wire rsta
                                  .wea(wea),              // input wire [0 : 0] wea
                                  .addra(addra),          // input wire [2 : 0] addra
                                  .dina(dina),            // input wire [7 : 0] dina
                                  .douta(douta),          // output wire [7 : 0] douta
                                  .rsta_busy()  // output wire rsta_busy
                                   );
endmodule
