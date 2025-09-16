module pipo(
  input clk,
  input rst,
  input [3:0]din,
  output reg [3:0]dout
);
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      dout<=4'b0000;
    end
    else begin
      dout<=din;
    end
  end
endmodule
