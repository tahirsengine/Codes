module UART_Tx(transmit, clk, dout);


input transmit, clk;
output reg dout;

reg   [8:0]  buffer;
reg          clk_baud;
reg   [9:0]  count;
reg   [6:0]  word = 7'h57; // hex = 57 = binary = 101 0111 = ASCII code for 7
reg   [3:0]  state;
reg          start;

parameter  idle      =   4'd0,
           start_bit =   4'd1,
           bit_0     =   4'd2,
           bit_1     =   4'd3,
           bit_2     =   4'd4,
           bit_3     =   4'd5,
           bit_4     =   4'd6,
           bit_5     =   4'd7,
           bit_6     =   4'd8,
           parity    =   4'd9;



always @ ( posedge clk_baud or negedge transmit ) begin
  if (~transmit) begin
     state   <=   start_bit;
     buffer  <=   {1'b0,word[6:0],1'b0}; // parity(odd) + word + start bit
     start   <=   1'b1;
  end else begin
     case(state)
       idle         : begin
                        dout  <= 1'b1;      // Stop bit
                        start <= 1'b0;
                      end
       start_bit    : begin
                        dout  <=  buffer[0]; // start bit
                        state <=  bit_0;
                      end
       bit_0        : begin
                        dout  <=  buffer[1]; // word[0]
                        state <=  bit_1;
                      end
       bit_1        : begin
                        dout  <=  buffer[2]; // word[1]
                        state <=  bit_2;
                      end
       bit_2        : begin
                        dout  <=  buffer[3]; // word[2]
                        state <=  bit_3;
                      end
       bit_3        : begin
                        dout  <=  buffer[4]; // word[3]
                        state <=  bit_4;
                      end
       bit_4        : begin
                        dout  <=  buffer[5]; // word[4]
                        state <=  bit_5;
                      end
       bit_5        : begin
                        dout  <=  buffer[6]; // word[5]
                        state <=  bit_6;
                      end
       bit_6        : begin
                        dout  <=  buffer[7]; // word[6]
                        state <=  parity;
                      end
       parity       : begin
                        dout  <= buffer[8]; // Parity
                        state <= idle;
                      end
      default       : state <= idle;
      endcase

   end
end


/*------ Producing clock/bauds at the rate of 9600 / second*/
always @ ( posedge clk ) begin
  if(start) begin
    count <= count + 1'b1;
    if(count > 10'd624) begin
      count     <= 'd0;
      clk_baud  <= ~clk_baud;
    end
  end else begin
    clk_baud <= 1'b0;
    count    <= 'd0;
  end
end



endmodule //
