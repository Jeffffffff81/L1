`default_nettype wire

module frequencyDivider(clk_in, clk_out, divisor);
	input logic clk_in;
	input logic[31:0]  divisor;
	output logic clk_out;

	logic[31:0] counter_out;
	logic counter_reset;
	
	counter counter(.clk(clk_in), .reset(counter_reset), .counter(counter_out));
	
	assign counter_reset = (counter_out >= (divisor-1)) ? 1'b1 : 1'b0;
	inverter inverter(.trigger(counter_reset), .out(clk_out)); 

endmodule

//module for inverter 
module inverter(trigger, out);
	input logic trigger; 
	output logic out = 0; //remove = 0 for synthesis 
	
	always_ff @(posedge trigger)
		out <= !out;
endmodule 
