module tb;
reg clk;
reg rst;
wire [7:0]dout;
wr g1(.clk(clk),.rst(rst),.dout(dout));
initial clk=0;
always #5clk=~clk;
initial begin
repeat(8)begin
rst=1;
#5;
rst=0;
end
$monitor("data=%0b",dout);
#200; $finish;
end
endmodule
