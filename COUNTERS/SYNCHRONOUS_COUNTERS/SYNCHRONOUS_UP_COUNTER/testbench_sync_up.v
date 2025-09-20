`timescale 1ns/1ps

module counter_tb;

  reg clk;
  reg rst;
  wire [3:0] count;

  // Instantiate the counter
  counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Clock generation: 10 ns period (100 MHz)
  always #5 clk = ~clk;

  initial begin
    // Initialize signals
    clk = 0;
    rst = 1;

    // Apply reset for 2 clock cycles
    #12 rst = 0;

    // Run counter for some cycles
    #200;

    // Apply reset again to check behavior
    rst = 1;
    #10 rst = 0;

    // Run more cycles
    #100;

    // Finish simulation
    $stop;
  end

  // Monitor output
  initial begin
    $monitor("Time=%0t | rst=%b | count=%b (%0d)", $time, rst, count, count);
  end

endmodule
