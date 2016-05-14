module counter(clk, reset, counter)
	#(parameter counter_width = 32);
	in clk;
	in reset;
	out counter[counter_width-1:0];
	
	always_ff(posedge clk) begin
			if(reset) begin
				counter <= 0
			end else begin
				counter <= counter + 1
			end
		end
		
endmodule
	