`timescale 1ns/1ps
module piso_tb;
  reg clk, rst, load;
  reg [3:0] din;
  wire dout;

  // DUT
  piso uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .din(din),
    .dout(dout)
  );

  initial clk = 0;
  always #5 clk = ~clk; // 10ns period

  initial begin
    $dumpfile("piso_tb.vcd");
    $dumpvars(0, piso_tb);

    rst = 1; load = 0; din = 4'b0000;
    #12 rst = 0;

    // Load data 1011
    #10 load = 0; din = 4'b1011;
    #10 load = 1;

    // Shift out
    #50;

    $finish;
  end
   initial begin
    $monitor("time=%d,clk=%b,rst=%b,load=%b,din=%b,dout=%b,shift_data=%b",$time,clk,rst,load,din,dout,uut.shift_reg);
  end
endmodule
