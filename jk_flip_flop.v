module jk_ff(
  input j,
  input k,
  input clk,
  input rst,
  output reg q,
  output wireqb
);
  assign qb=~q;
  always@(posedge clk)begin
    if(rst)begin
      q<=1'b0;
    end 
    else begin
      if(j==0 && k==0)begin
        q<=q;
      end
      else if(j==0 && k==1)begin
        q<=0;
      end
      else if(j==1 && k==0)begin
        q<=1;
      end
      else begin
        q<=qb;
      end
    end
  end
endmodule
