module regFile (input logic clk, 
					 input logic we, 
					 input logic [4:0] a1, a2, a3, 
					 input logic [31:0] wd, 
					 output logic [31:0] rd1, rd2);

	logic [31:0] regf [31:0];

	always_ff @(posedge clk) 
	begin
		if (we && (a3!=0))
		regf[a3] <= wd;
	end

	assign rd1 = a1==0 ? 0 : regf[a1];
	assign rd2 = a2==0 ? 0: regf[a2];

endmodule
