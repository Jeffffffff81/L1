`default_nettype wire

module frequencyDivider(clk_in, clk_out, divisor);
	input logic clk_in;
	input logic[31:0]  divisor;
	output reg clk_out;

	logic[31:0] counter_out;
	logic reset_counter ;
	
	assign reset_counter = (counter_out >= divisor);
	
	counter counter(.clk(clk_in), .reset(reset_counter), .counter(counter_out));
		
	always_ff @(posedge clk_in)
	if(reset_counter) begin
		clk_out = !clk_out;
		end
	
endmodule