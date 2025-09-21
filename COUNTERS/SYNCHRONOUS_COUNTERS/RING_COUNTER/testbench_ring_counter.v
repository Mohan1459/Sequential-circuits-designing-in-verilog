module tb;
  reg clk;
  reg rst;
  wire [3:0]q;
  ring_counter g1(.clk(clk),.rst(rst),.q(q));
  initial clk=0;
  always #5clk=~clk;
  initial begin
    rst=1'b1;
    #10;
    rst=1'b0;
    #40;
    $finish;
  end
  initial begin
    $monitor("Time=%d,clk=%b,reset=%b,output=%b",$time,clk,rst,q);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
