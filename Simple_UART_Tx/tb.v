`timescale 1ps / 1ps
module tb;

reg  transmit;
reg  clk;
wire  dout;

UART_Tx inst (.transmit(transmit),   .clk(clk),  .dout(dout));

initial begin
clk      =  1'b0;
transmit =  1'b1;
#10;
transmit = 1'b0;
#3;
transmit = 1'b1;
#25;
$stop;
end

always #1 clk = ~ clk;
endmodule
