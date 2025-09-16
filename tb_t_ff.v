module tb;
 reg clk;
 reg rst;
 reg t;
 wire q;
 wire qb;
  t_ff g1(.clk(clk),.rst(rst),.t(t),.q(q),.qb(qb));
  initial clk=0;
  always #2.5 clk=~clk;
  initial begin
    rst=1;
    t=0;
    #5;
    rst=0;
    t=0;
    #3;
    t=1;
    #10; 
    $finish;
  end
  initial begin
    $monitor("time=%d,clk=%b,rst=%b,t=%b,q=%b,qb=%b",$time,clk,rst,t,q,qb);
  end
 initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
