module clk_div #(parameter diviser=6)
  (
    input clk,
    input rst,
    output reg clk_out
  );
  integer count;
  always@(posedge clk)begin
    if(rst)begin
      clk_out<=1'b0;
      count<=4'b0000;
    end
    else begin
      if(count==(diviser/2)-1)begin
        clk_out<=~clk_out;
        count=0;
      end
      else begin
        count<=count+1;
    end
  end
 end
endmodule
