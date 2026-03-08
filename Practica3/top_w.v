module top_w (
	input [1:0] KEY,
	input MAX10_CLK1_50,
	input [9:0] SW,
	//input [9:0] SW1,
	//input [9:0] KEY1,
	output[0:6] HEX0,
	output[0:6] HEX1,
	output[0:6] HEX2
);

top WRAP (
	.CLK(MAX10_CLK1_50),
	.rst(~KEY[0]),
	.load(~KEY[1]),
	.up_down(SW[0]),
	.data_in(SW[7:1]),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2)

);

endmodule