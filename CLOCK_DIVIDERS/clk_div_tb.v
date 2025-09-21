module tb_clk_div_1p5;

  reg clk;
  reg rst;
  wire clk_out;

  // Instantiate DUT
  clk_div_1p5 uut (
    .clk(clk),
    .rst(rst),
    .clk_out(clk_out)
  );

  // Generate clock: 10ns period = 100 MHz
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // toggle every 5ns
  end

  // Stimulus
  initial begin
    // Initialize
    rst = 1;
    #20;
    rst = 0;

    // Run simulation for some time
    #200 $finish;
  end

  // Monitor output
  initial begin
    $monitor("Time=%0t | clk=%b | clk_out=%b", $time, clk, clk_out);
  end
 initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
