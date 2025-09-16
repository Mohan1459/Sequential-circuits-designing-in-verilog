module tb;
 reg clk;
 reg rst;
 reg j;
 reg k;
 wire q;
 wire qb;
  jk_ff g1(.clk(clk),.rst(rst),.j(j),.k(k),.q(q),.qb(qb));
  initial clk=0;
  always #2.5 clk=~clk;
  initial begin
    rst=1;
    j=0; k=0;
    #5;
    rst=0;
    {j,k}=2'b00;#5;
    {j,k}=2'b01;#5;
    {j,k}=2'b10;#5;
    {j,k}=2'b11;#5;
    $finish;
  end
  initial begin
    $monitor("time=%d,clk=%b,rst=%b,j=%b,k=%b,q=%b,qb=%b",$time,clk,rst,j,k,q,qb);
  end
 initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
