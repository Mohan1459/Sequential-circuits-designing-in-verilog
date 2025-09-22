module dual_port_ram(
  input clk,
  input [7:0]data_in1,
  input [7:0]data_in2,
  input [7:0]addr1,
  input [7:0]addr2,
  input w_en1,
  input w_en2,
  output reg [7:0]data_out1,
  output reg [7:0]data_out2
);
  reg [7:0]mem[15:0];
  always@(posedge clk)begin
    if(w_en1)begin
      mem[addr1]<=data_in1;
    end
    else begin
      data_out1<=mem[addr1];
    end
  end
  always@(posedge clk)begin
    if(w_en2)begin
      mem[addr2]<=data_in2;
    end
    else begin
      data_out2<=mem[addr2];
    end
  end
endmodule
