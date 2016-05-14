module frequencyDivider(clk_in, clk_out, divisor);
	input clk_in;
	output clk_out = 0;
	input divisor;
	
	logic counter_out;
	logic counter_reset;
	
	counter counter(.clk(clk_in), .reset(counter_reset), .counter(counter_out));
	
	assign counter_reset = (counter_out == div) ? 1'b1 : 1'b0;
	assign clk_out = (counter_reset) ? !clk_out : clk_out;
	
endmodule