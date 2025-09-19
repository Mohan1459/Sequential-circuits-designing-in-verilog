module tb;
  reg clk;
  reg rst;
  wire [3:0]count;
  counter g1(.clk(clk),.rst(rst),.count(count));
  initial clk=0;
  always #5clk=~clk;
  initial begin
    rst=0;
    #5;
    rst=1;
    #90;
    rst=0;
    $finish;
  end
  initial begin
    $monitor("time=%d,clk=%b,rst=%b,present_state=%b",$time,clk,rst,count);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
