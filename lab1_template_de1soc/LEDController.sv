module LEDController(clock, out);
	input clock;
  logic[7:0] pre_out = 7'b0; //used to remove glitches. place a register between pre-out and out
	output logic[7:0] out;
	
	parameter S0 = 4'b0000;
	parameter S1 = 4'b0001;
	parameter S2 = 4'b0010;
	parameter S3 = 4'b0011;
	parameter S4 = 4'b0100;
	parameter S5 = 4'b0101;
	parameter S6 = 4'b0110;
	parameter S7 = 4'b0111;
	parameter S8 = 4'b1000;
	parameter S9 = 4'b1001;
	parameter S10 = 4'b1010;
	parameter S11 = 4'b1011;
	parameter S12 = 4'b1100;
	parameter S13 = 4'b1101;
	parameter S14 = 4'b1110;
	
	reg [3:0] present_state = 0;
	reg [3:0] next_state = 0;
	
	always_ff @(posedge clock)
		present_state = next_state;
	
	//remove glitches:
	always_ff @(posedge clock)
		out = pre_out;
		
	always_comb begin
		case (present_state)
			S0: {next_state, pre_out} = { S1, 8'b00000001} ;
			S1: {next_state, pre_out} = { S2, 8'b00000010 } ;
			S2: {next_state, pre_out} = { S3, 8'b00000100 } ;
			S3: {next_state, pre_out} = { S4, 8'b00001000 } ;
			S4: {next_state, pre_out} = { S5, 8'b00010000 } ;
			S5: {next_state, pre_out} = { S6, 8'b00100000 } ;
			S6: {next_state, pre_out} = { S7, 8'b01000000 } ;
			S7: {next_state, pre_out} = { S8, 8'b10000000 } ;
			S8: {next_state, pre_out} = { S9, 8'b01000000} ;
			S9: {next_state, pre_out} = { S10, 8'b00100000 } ;
			S10: {next_state, pre_out} = { S11, 8'b00010000 } ;
			S11: {next_state, pre_out} = { S12, 8'b00001000 } ;
			S12: {next_state, pre_out} = { S13, 8'b00000100 } ;
			S13: {next_state, pre_out} = { S0, 8'b00000010 } ;
			default: {next_state, pre_out} = { S1, 8'b00000001} ; 
		endcase 	
	end
endmodule
