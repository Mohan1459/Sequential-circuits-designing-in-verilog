module tb;
  reg clk, rst, din;
  wire [3:0]dout;

  // Instantiate DUT
  siso uut (
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
    #8  din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 1;

    // Keep shifting with 0s
    #40 din = 0;

    #20 $finish;
  end
  initial begin
    $monitor("time=%d,clk=%b,rst=%b,din=%b,dout=%b,shift_reg=%b",$time,clk,rst,din,dout,uut.shift_reg);
  end
endmodule
