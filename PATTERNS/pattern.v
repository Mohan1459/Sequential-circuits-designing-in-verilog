module wr(
input clk,
input rst,
output reg [7:0]dout
);
always@(posedge clk or posedge rst)begin
if(rst)begin
dout<=8'b11111110;
end
else begin 
dout<={dout[6:0],dout[7]};
end
end
endmodule
