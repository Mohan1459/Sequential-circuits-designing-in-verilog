module fifo(
  input clk,
  input rst,
  input w_en,
  input r_en,
  input [15:0]data_in,
  output reg [15:0]data_out,
  output empty,
  output full
);
  reg [3:0]wptr;
  reg [3:0]rptr;
  reg [15:0]mem[7:0];
  
  always@(posedge clk or posedge rst)
    begin
    if(rst)
      begin
        data_out<=0;
        wptr<=0;
        rptr<=0;
      end
    else 
      begin
        if(w_en && !full)begin
          mem[wptr]<=data_in;
          wptr<=wptr+1;
        end

      if(r_en && !empty)
        begin
          data_out<=mem[rptr];
          rptr<=rptr+1;
        end
      end
    end
  assign full=(wptr+1==rptr);
  assign empty=(wptr==rptr);
endmodule
  
    
  
