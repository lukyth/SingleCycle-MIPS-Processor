module leftshift2#(parameter W = 32)
	(
		input[31:0] in,
		output reg[31:0] out
	);

	always@(*)
		begin
			out = 32'h003FFFFC;
			out = in<<2;
		end

endmodule
