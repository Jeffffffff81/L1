module mux8(a0, a1, a2, a3, a4, a5, a6, a7, out, sel);
	parameter width = 8;
	input[width-1:0] a0, a1, a2, a3, a4, a5, a6, a7;
	input[2:0] sel;
	output[width-1:0] out;
	
	always_comb
		case(sel)
			3'b000: out = a0;
			3'b001: out = a1;
			3'b010: out = a2;
			3'b011: out = a3;
			3'b100: out = a4;
			3'b101: out = a5;
			3'b110: out = a6;
			3'b111: out = a7;
			default: out = 0;
		endcase
endmodule