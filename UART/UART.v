module UART(clk,din,transmit, indicator,dout);

input         clk, din;
input         transmit;
output  [7:0] indicator;
output        dout;


UART_Rx inst_0(.din(din),             .clk(clk),   .indicator(indicator));
UART_Tx inst_1(.transmit(transmit),   .clk(clk),   . dout(dout));

endmodule
