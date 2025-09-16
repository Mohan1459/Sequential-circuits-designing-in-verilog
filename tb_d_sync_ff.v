
module tb;
 reg clk;
 reg rst;
 reg d;
 wire q;
  d_ff g1(.clk(clk),.rst(rst),.d(d),.q(q));
  initial clk=0;
  always #2.5 clk=~clk;
  initial begin
    rst=1;
    d=0;
    #5;
    d=1;
    rst=0;
    #5;
    d=0;
    $finish;
  end
  initial begin
    $monitor("time=%d,clk=%b,rst=%b,d=%b,q=%b",$time,clk,rst,d,q);
  end
 initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
