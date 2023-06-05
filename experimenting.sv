module experiment(input logic [2:0] a, b);

	always_comb begin
		
		if ($signed(a) < $signed(b))
			$display("use $signed for signed values , signed a < signed b");
		if ($signed(a) > $signed(b))
			$display("use $signed for signed values , signed a > signed b");
		if($unsigned(a) > $unsigned(b))
			$display("use $unsigned for unsigned values, unsigned a > unsigned b");
		if($unsigned(a) < $unsigned(b))
			$display("use $unsigned for unsigned values, unsigned a < unsigned b");
		if(a > b)
			$display("a>b");
		else
			$display("a<b");
		$display("go fuck yourself");
		
	end


endmodule 
