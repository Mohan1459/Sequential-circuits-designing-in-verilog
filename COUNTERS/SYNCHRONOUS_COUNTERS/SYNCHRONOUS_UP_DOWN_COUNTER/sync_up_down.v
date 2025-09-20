module up_down_counter(
  input clk,
  input rst,
  output reg [7:0]count
);
  reg up_down;
  always@(posedge clk)begin
    if(rst)begin
      count<=8'd7;
    end
    else begin
      if(up_down)begin
        if(count<8'd210)begin
          count<=count+8'd7;
        end
        else begin
          up_down<=1'b0;
          count<=count-8'd7;
        end
      end
      else begin
        if(count>8'd7)begin
          count<=count-8'd7;
        end
        else begin
          up_down<=1'b1;
          count<=count+8'd7;
        end
      end
    end
  end
endmodule
