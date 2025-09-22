module tb;
  reg clk;
  reg w_en1;
  reg w_en2;
  reg [7:0]data_in1;
  reg [7:0]data_in2;
  reg [7:0]addr1;
  reg [7:0]addr2;
  wire [7:0]data_out1;
  wire [7:0]data_out2;
  dual_port_ram(.clk(clk),.data_in1(data_in1),.data_in2(data_in2),.addr1(addr1),.addr2(addr2),.w_en1(w_en1),.w_en2(w_en2),.data_out1(data_out1),.data_out2(data_out2));
  initial clk=0;
  always #5clk=~clk;
  initial begin
    data_in1=8'd0;    
    data_in2=8'd0;
    w_en1=1'b0;
    w_en2=1'b0;
    addr1=8'd0;
    addr2=8'd0;
    #40;
    data_in1=8'd7;
    #20;
    data_in2=8'd9;
    #30;
    addr1=8'd4;
    addr2=8'd5;
    #40;
    w_en1=1;
    #30;
    w_en1=0;
    #20;
    w_en2=1;
    #40
    w_en2=0;
    #200; $finish;
  end
  initial begin
    $monitor("Time=%d,clk=%b,data_in1=%d,data_in2=%d,w_en1=%b,w_en2=%b,addr1=%d,addr2=%d,data_out1=%d,data_out2=%d",$time,clk,data_in1,data_in2,w_en1,w_en2,addr1,addr2,data_out1,data_out2);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
