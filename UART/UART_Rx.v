module UART_Rx(din,clk,indicator);

input            din, clk;
output reg [7:0] indicator;



reg    [9:0]    count;    // counting to generate clock
reg    [3:0]    rx_count;    // counting the bits received : 7 intended
reg    [3:0]    state;
reg    [7:0]    buffer;    // the received data
reg    [14:0]   indication_count;  // Counts for LED indication
reg             clk_baud;


parameter  idle = 4'd0, receive = 4'd1, decision = 4'd2;

initial clk_baud = 1'b0;
initial count    = 'd0;

always @ ( posedge clk_baud) begin
     case(state)
     idle             : begin
                        rx_count   <=    4'h0;
                        indicator  <=    8'b00000000;
                        indication_count <= 'd0;
                        if (~din) begin
                          rx_count  <=   4'h0;
                          state     <=   receive;
                          buffer    <=   'd0;
                          indicator <=    8'b00000000;
                        end
                        end
     receive          : begin
                         buffer     <= {din,buffer[7:1]};
                         rx_count   <= rx_count + 1'b1;
                         if(rx_count > 4'h6) begin
                           state <= decision;
                         end
                        end
     decision         : begin
                        if((buffer[6:0] == 7'h47) && (buffer[7] == 1'b0)) begin  // Even parity, here 0, code for G
                          indicator        <= 8'b00001111;
                          indication_count <= indication_count + 1'b1;
                          if (indication_count > 15'd9700)
                          state     <=   idle;
                        end else begin
                          state     <=   idle;
                          indicator <= 8'b00000000;
                        end
                        end
     default          : state <= idle;
     endcase
end
/*------ Producing clock/bauds at the rate of 9600 / second*/
always @ ( posedge clk ) begin
    count <= count + 1'b1;
    if(count > 10'd624) begin
      count     <= 'd0;
      clk_baud  <= ~clk_baud;
    end
end


endmodule
