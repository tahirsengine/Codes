
task assertion_check;
  input as;
  input [3:0] c;
  begin
    if(as) begin
      assert (c <= 4'd12) $display ("Sum is lower than or equal to decimal 12");
      else $display ("Sum is higher than decimal 12");
    end else begin
      assert (c <= 4'd4) $display ("Substration result is lower than or equal to decimal 4");
      else $display ("Substration is higher than decimal 4");
     end
  end
endtask


task driver1;
  begin
    a  = 3'd7;
    b  = 3'd7;
    as = 1'b1;
    assertion_check(as,c);
    #4;
    a  = 3'd3;
    b  = 3'd2;
    assertion_check(as,c);
    #4;
    a  = 3'd6;
    b  = 3'd6;
    assertion_check(as,c);
    #4;
  end
endtask

task driver2;
  begin
      a  = 3'd7;
      b  = 3'd7;
      as = 1'b0;
      assertion_check(as,c);
      #4;
      a  = 3'd3;
      b  = 3'd2;
      assertion_check(as,c);
      #4;
      a  = 3'd7;
      b  = 3'd1;
      assertion_check(as,c);
      #4;
  end
endtask
