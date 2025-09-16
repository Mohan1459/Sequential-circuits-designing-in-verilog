module t_ff(
  input t,
  input clk,
  input rst,
  output reg q,
  output wire qb
);
  assign qb=~q;
  always@(posedge clk)begin
    if(rst)begin
      q<=1'b0;
    end 
    else if(t==1'b1)begin
      q<=qb;
      end
    else begin
      q<=q;  
    end
  end
endmodule
