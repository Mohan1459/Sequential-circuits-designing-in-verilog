module tb;
  reg clk, rst;
  reg [3:0]din;
  wire [3:0]dout;

  // Instantiate DUT
  pipo uut (
    .clk(clk),
    .rst(rst),
    .din(din),
    .dout(dout)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;  // 10ns period

  // Stimulus
  initial begin
    $dumpfile("siso_left_tb.vcd");
    $dumpvars(0, tb);

    rst = 1; din = 0;
    #12 rst = 0;

    // Shift in bits: 1,0,1,1
    #8  din = 4'b1011;
    // Keep shifting with 0s
    #40 din = 0;

    #20 $finish;
  end
  initial begin
    $monitor("time=%d,clk=%b,rst=%b,din=%b,dout=%b",$time,clk,rst,din,dout);
  end
endmodule
