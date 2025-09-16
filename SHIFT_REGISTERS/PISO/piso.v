module piso(
  input clk,
  input rst,
  input load,
  input [3:0]din,
  output wire dout
);
  reg [3:0]shift_reg;
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      shift_reg<=4'b0000;
    end
    else begin
      if(!load)begin
       shift_reg<=din;
      end
      else begin
        shift_reg<={1'b0,shift_reg[3:1]};
      end
    end
  end
  assign dout=shift_reg[0];
endmodule
