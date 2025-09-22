`timescale 1ns/1ps
module tb;
  reg clk;
  reg rst;
  reg w_en;
  reg r_en;
  reg [15:0] data_in;
  wire [15:0] data_out;
  wire empty;
  wire full;

  fifo g1 (
    .clk(clk),
    .rst(rst),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .empty(empty),
    .full(full)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    // Initialize
    rst = 1;
    w_en = 0;
    r_en = 0;
    data_in = 16'd0;

    // Apply reset
    #12;
    rst = 0;

    // Write phase
    w_en = 1;
    r_en = 0;
    data_in = 16'd32; #10;
    data_in = 16'd12; #10;
    data_in = 16'd5;  #10;
    w_en = 0;

    // Read phase
    #20;
    r_en = 1;
    #40;
    r_en = 0;

    #50 $finish;
  end

  // Monitor
  initial begin
    $monitor("TIME=%0t | CLK=%b | RST=%b | WEN=%b | REN=%b | DIN=%d | DOUT=%d | EMPTY=%b | FULL=%b",
              $time, clk, rst, w_en, r_en, data_in, data_out, empty, full);
  end

  // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
