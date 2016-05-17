`default_nettype wire

module frequencyDivider(clk_in, clk_out, divisor);
	input logic clk_in;
	input logic[31:0]  divisor;
	output reg clk_out;

	logic[31:0] counter_out;
	logic counter_reset;
	logic pre_clk_out;
	
	counter counter(.clk(clk_in), .reset(counter_reset), .counter(counter_out));
	vDFF #(.width(1)) flipflip(.in(!pre_clk_out), .out(pre_clk_out), .clk(counter_reset));
	
	assign counter_reset = (counter_out >= (divisor-1)) ? 1'b1 : 1'b0;
	assign clk_out = pre_clk_out;
	

endmodule

