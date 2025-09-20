module counter_tb;

  reg clk;
  reg rst;
  wire [7:0] count;

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

    // Hold reset for a bit
    #12 rst = 0;

    // Run for enough cycles to see up and down counting
    #2000;

    // Apply reset again mid-way
    rst = 1;
    #10 rst = 0;

    // Run again
    #1000;

    $stop;
  end

  // Monitor signals
  initial begin
    $monitor("Time=%0t | rst=%b | count=%0d", $time, rst, count);
  end

endmodule
