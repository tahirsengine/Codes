`timescale 1ns / 1ps


module tb_control();

reg clk, rst, datavalid;
reg [2:0] addr;
reg [7:0] data;
wire      a1,a2,b1,b2,c1,c2;


control inst1(  .clk(clk),
                .rst(rst),
                .datavalid(datavalid),
                .data(data),
                .addr(addr),
                .a1(a1),
                .a2(a2),
                .b1(b1),
                .b2(b2),
                .c1(c1),
                .c2(c2));

initial begin
clk = 1'b0;
rst = 1'b1;
datavalid = 1'b0;
addr = 3'd0;
data = 8'd0;

#4;
rst = 1'b0;
#2;
addr      = 3'b001;
data      = 8'hAB;
datavalid = 1'b1; // Data valid
#4;
addr      = 3'b010;
data      = 8'h12;
#4;
addr      = 3'b100;
data      = 8'h89;



#4;
datavalid = 1'b0;  // Invalid data
addr      = 3'b001;
data      = 8'hCA;
#4;
addr      = 3'b010;
data      = 8'h56;
#4;
addr      = 3'b100;
data      = 8'h01;
#10;
rst = 1'b1;
#10;
$stop;
end

always #1 clk = ~clk;
endmodule
