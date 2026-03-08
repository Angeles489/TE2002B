module top(
	input CLK,
	input rst,
	input up_down,
	input load,
	input [6:0] data_in,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2
);

wire CLK_div;
wire [6:0] count; 

Contador100 #(.CMAX(100)) CONT(
	.CLK(CLK_div),
	.rst(rst),
	.up_down(up_down),
	.count(count),
	.load(load),
	.data_in(data_in)
);
 

CLK_divider #(.FREQ(5)) DIV(
		.CLK(CLK),
		.rst(rst),
		.CLK_div(CLK_div)
	);

BCD_module MOD(
	.bcd_in(count)
);


BCD_4displays #(.N_in(7), .N_out(7))DISP(
	.bcd_in(count),
	.D_un(HEX0),
	.D_de(HEX1),
	.D_ce(HEX2)
);

endmodule 