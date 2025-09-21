module fsm_mealy_11011(
  input clk,
  input din,
  input rst,
  output reg dout
);
  reg [2:0] ps, ns;

  parameter s0 = 3'b000; 
  parameter s1 = 3'b001; 
  parameter s2 = 3'b010; 
  parameter s3 = 3'b011; 
  parameter s4 = 3'b100; 
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      ps   <= s0;
      dout <= 1'b0;
    end else begin
      ps   <= ns;
    end
  end

  always @(*) begin
    ns   = ps;
    dout = 1'b0;

    case (ps)
      s0: begin
        if (din) ns = s1;
        else     ns = s0;
      end

      s1: begin 
        if (din) ns = s2;  
        else     ns = s0;  
      end

      s2: begin 
        if (din) ns = s2; 
        else     ns = s3;  
      end

      s3: begin 
        if (din) ns = s4;  
        else     ns = s0;
      end

      s4: begin 
        if (din) begin
          ns   = s2;   
          dout = 1'b1; 
        end
        else ns = s0;
      end
    endcase
  end
endmodule
