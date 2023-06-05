module aluDec (input logic [1:0] aluop,
					input logic op5, funct7b5,
					input logic [2:0] funct3,
					output logic [3:0] alucontrol);

	always_comb begin
	
		case(aluop)
		2'b00: alucontrol = 4'b0000;
		2'b01: alucontrol = 4'b0001;
		2'b10: case (funct3)
					3'b000: if({op5, funct7b5} == 2'b11)
									alucontrol = 4'b0001;
							  else
									alucontrol = 4'b0000;
					3'b001: // sll
							  alucontrol = 4'b0111;
					3'b010: alucontrol = 4'b0101;
					3'b011:// sltu
							  alucontrol = 4'b1000;
					3'b100:// xor
							  alucontrol = 4'b1001;
					3'b101: if(funct7b5) // sra
									alucontrol = 4'b0100;
							  else // srl
									alucontrol = 4'b0110;
					3'b110: alucontrol = 4'b0011;
					3'b111: alucontrol = 4'b0010;
					default: alucontrol = 4'bx;
				 endcase
		default: alucontrol = 4'bx;
		endcase
	end

endmodule 