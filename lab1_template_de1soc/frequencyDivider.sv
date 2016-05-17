`default_nettype wire

module frequencyDivider(clk_in, clk_out, divisor);
	input logic clk_in;
	input logic[31:0]  divisor;
	output reg clk_out = 0;

	reg[31:0] counter = 0;
	reg reset_counter = 0 ;
	
	always_ff @(posedge clk_in)
		if(counter == divisor) begin
			counter <= 0;
			reset_counter <= 1;
		end else begin
			counter <= counter+1;
			reset_counter <= 0;
		end
		
	always_ff @(posedge reset_counter)
		clk_out = !clk_out;
	
endmodule

