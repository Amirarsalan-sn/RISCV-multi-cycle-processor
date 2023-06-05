module branchDec(input logic [6:0] op,
					  input logic [2:0] funct3,
					  input logic branch,
					  output logic beq, bne, blt, bge, bltu, bgeu);

		assign beq = (op == 7'b1100011) & (funct3 == 3'b000) & branch ;
		assign bne = (op == 7'b1100011) & (funct3 == 3'b001) & branch ;
		assign blt = (op == 7'b1100011) & (funct3 == 3'b100) & branch ;
		assign bge = (op == 7'b1100011) & (funct3 == 3'b101) & branch ;
		assign bltu = (op == 7'b1100011) & (funct3 == 3'b110) & branch ;
		assign bgeu = (op == 7'b1100011) & (funct3 == 3'b111) & branch ;
					
endmodule  