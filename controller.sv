module controller(input logic clk,
						input logic reset,
						input logic [6:0] op,
						input logic [2:0] funct3,
						input logic funct7b5,
						input logic zero, cout, overflow, sign,
						output logic [2:0] immsrc,
						output logic [1:0] alusrca, alusrcb,
						output logic [1:0] resultsrc,
						output logic adrsrc,
						output logic [3:0] alucontrol,
						output logic irwrite, pcwrite,
						output logic regwrite, memwrite);
						
	logic beq, bne, blt, bge, bltu, bgeu, branch, pcupdate;
	logic [1:0] aluop;
	
	fsm MainFSM(clk, reset, op, branch, pcupdate, regwrite, 
					memwrite, irwrite, resultsrc, alusrcb, alusrca, adrsrc, aluop);
	aluDec AluDecoder(aluop, op[5], funct7b5, funct3, alucontrol);
	instrDec InstrDecoder(op, immsrc);
	branchDec BranchDecoder(op, funct3, branch, beq, bne, blt, bge, bltu, bgeu); 
	
	assign pcwrite = (beq & zero) | (bne & ~zero) | (bgeu & cout) | (bltu & ~cout) 
	| (bge & (sign == overflow)) | (blt & (sign != overflow)) | pcupdate;
	
	
	
endmodule 