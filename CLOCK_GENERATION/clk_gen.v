module tb;
  reg clk;
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $monitor("time=%d,clk=%b",$time,clk);
    #50;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
