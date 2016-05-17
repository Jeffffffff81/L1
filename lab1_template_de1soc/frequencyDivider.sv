`default_nettype wire

module frequencyDivider(clk_in, clk_out, divisor);
	input logic clk_in;
	input logic[31:0]  divisor;
	output reg clk_out;

	logic[31:0] counter_out;
	logic reset_counter ;
	
	assign reset_counter = (divisor == counter_out);
	
	counter counter(.clk(clk_in), .reset(reset_counter), .counter(counter_out));
		
	always_ff @(posedge reset_counter)
		clk_out = !clk_out;
	
endmodule

