module d_ff(
  input d,
  input clk,
  input rst,
  output reg q
);
  always@(posedge clk or negedge rst)begin
    if(!rst)begin
      q<=1'b0;
    end 
    else begin
      q<=d;
    end
  end
endmodule
