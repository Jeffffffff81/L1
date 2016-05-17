module vDFF(in, out, clk);
  parameter width = 8;
  input logic[width-1:0] in;
  input logic clk;
  output logic[width-1:0] out;
  
  always_ff @(posedge clk)
    begin
      out <= in;
    end
    
endmodule