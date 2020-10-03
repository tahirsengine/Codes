`timescale 1ns / 1ps

module control(clk, rst, datavalid, addr, data, a1,a2,b1,b2,c1,c2);
input  clk;
input  rst;
input [2:0] addr;
input [7:0] data;
input datavalid;
reg [7:0] regA, regB, regC; // Internal registers
output a1,a2,b1,b2,c1,c2;

always @(posedge clk) begin
   if(rst)begin 
     regA = 8'h00; 
     regB = 8'h00; 
     regC = 8'h00; 
   end else if(datavalid) begin
    case(addr)
     3'b001:  regA = data;
     3'b010:  regB = data;
     3'b100:  regC = data;
    endcase
   end
end 

assign a1 =  (regA[7:4] == 4'hA)? 1'b1:1'b0;
assign a2 =  (regA[3:0] == 4'hB)? 1'b1:1'b0;
assign b1 =  (regB[7:4] == 4'h1)? 1'b1:1'b0;
assign b2 =  (regB[3:0] == 4'h2)? 1'b1:1'b0;
assign c1 =  (regC[7:4] == 4'h8)? 1'b1:1'b0;
assign c2 =  (regC[3:0] == 4'h9)? 1'b1:1'b0;

endmodule
