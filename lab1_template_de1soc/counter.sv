module counter(clk, reset, counter);
	parameter counter_width = 32;
	input clk;
	input reset;
	output logic[counter_width-1:0] counter;
	
	always_ff @(posedge clk) begin
			if(reset) begin
				counter <= 0;
			end else begin
				counter <= counter + 1;
			end
		end
		
endmodule
