module alu (input logic [31:0] src1, src2, input logic [3:0] aluc, output logic [31:0] out, output logic zero,
				output logic cout, overflow, sign);
	
	always_comb begin
		case (aluc)
		4'b0000: begin
			{cout, out} = {1'b0, src1} + {1'b0, src2};
			end
		4'b0001: begin
			{cout, out} = {1'b0, src1} + {1'b0, ~src2} + 9'b1;
 			end
		4'b0010: begin 
			out = src1 & src2;
			cout = 0;
			end
		4'b0011: begin 
			out = src1 | src2;
			cout = 0;
			end
		4'b0100: begin // sra
			out = $signed(src1) >>> $unsigned(src2[4:0]);
			cout = 0;			
			end
		4'b0101: begin
			if ($signed(src1) < $signed(src2))
				out = 1;
			else
				out = 0;
			cout = 0;				
			end
		4'b0110: begin // srl
			out = src1 >> src2[4:0];
			cout = 0;			
			end
		4'b0111: begin // sll
			out = src1 << src2[4:0];
			cout = 0;			
			end
		4'b1000: begin // sltu
			if($unsigned(src1) < $unsigned(src2))
				out = 1;
			else
				out = 0;
			cout = 0;				
			end
		4'b1001: begin // xor
			out = src1 ^ src2;
			cout = 0;			
		end
		default: begin
			out = 0;
			cout = 0;			
			end 
		endcase
		if (out==0)
			zero = 1;
		else
			zero = 0;
		sign = out[31];
		overflow = (~((src1[31] ^ src2[31]) ^ aluc[0])) & (src1[31] ^ sign) & ~aluc[1]; 
	end

endmodule 