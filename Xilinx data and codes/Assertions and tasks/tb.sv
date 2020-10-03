`timescale 1ns / 1ps



module tb();
  reg  [2:0] a, b;
  wire [3:0] c;
  reg clk;
  reg as;

`include "helper_methods.sv"

  add_sub inst(  .clk(clk),
                 .a(a),
                 .b(b),
                 .c(c),
                 .as(as));

initial begin
  clk = 1'b0;
  driver1();
  driver2();
  $stop;
end



always #1 clk = ~clk;


endmodule
