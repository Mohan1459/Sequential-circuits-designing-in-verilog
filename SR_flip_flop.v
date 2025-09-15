module sr_ff(
  input s,
  input r,
  input clk,
  input rst,
  output reg q,
  output reg qb
);
  always@(posedge clk)begin
    if(rst)begin
      q<=1'b0;
    end 
    else begin
      if(s==1'b0 && r==1'b0)begin
        q<=q;
      end
      else if(s==1'b0 && r==1'b1)begin
        q<=1'b0;
      end
      else if(s==1'b1 && r==1'b0)begin
        q<=1'b1;
      end
      else begin
        q<=1'bx;
      end
    end
  end
 assign qb=~q;
endmodule
