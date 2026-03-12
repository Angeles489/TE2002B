module Cronometro_w(
	input MAX10_CLK1_50,
	input [1:0] KEY,
	output [0:6] HEX0,
	output [0:6] HEX1,
	output [0:6] HEX2,
	output [0:6] HEX3,
	output [0:6] HEX4
);

Cronometro DUT(
	.clk(MAX10_CLK1_50),
	.rst(~KEY[0]),
	.pausa(~KEY[1]),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3),
	.HEX4(HEX4)
);

// Displays en la tarjeta

//BCD_module mc (.bcd_in(m_cen),.bcd_out(HEX0));
//BCD_module md (.bcd_in(m_dec),.bcd_out(HEX1));
//BCD_module mu (.bcd_in(m_uni),.bcd_out(HEX2));
//BCD_module un (.bcd_in(unidades),.bcd_out(HEX3));
//BCD_module de (.bcd_in(decenas),.bcd_out(HEX4));
					
endmodule