module instrDec ( input logic [6:0] op,
						output logic [2:0] immsrc);

	always_comb begin
	
		case(op)
		7'b0110011: immsrc = 3'b000;
		7'b0010011: immsrc = 3'b000;
		7'b0000011: immsrc = 3'b000;
		7'b0100011: immsrc = 3'b001;
		7'b1100011:	immsrc = 3'b010;
		7'b1101111: immsrc = 3'b011;
		7'b0010111: immsrc = 3'b100;
		7'b0110111: immsrc = 3'b100;
		7'b1100111: immsrc = 3'b000;
		default: immsrc = 3'bx;
		endcase
	
	end
						
						
endmodule 