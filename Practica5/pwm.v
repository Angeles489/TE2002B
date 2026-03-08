module pwm( 
	input [7:0] SW,
	input clk,
	input rst,
	output reg pwm_out,
	output [0:6] HEX0,
	output [0:6] HEX1,
	output [0:6] HEX2
);

wire CLK_div;
wire [19:0] count;

clock_divider #(.FREQ(25_000_000)) DIV(
		.clk(clk),
		.rst(rst),
		.clk_div(CLK_div)
	);


reg [9:0] sw_lim;

always @(*)
begin
if( SW > 180)
	sw_lim = 180;
	else
	sw_lim = SW;
end

BCD_4displays #(.N_in(10), .N_out(7)) DISP(
	.bcd_in(sw_lim),
	.D_un(HEX0),
	.D_de(HEX1),
	.D_ce(HEX2)
);

contador #(.CMAX(500_000)) CONT(
		.clk(CLK_div),
		.rst(rst),
		.count(count)
);


reg [19:0] comparador;


//Comparador 
always @(posedge CLK_div or posedge rst)
	begin
		if(rst)
		pwm_out <= 0;
		else
			begin
			comparador <= ((50000 * sw_lim) / 180) + 13500;
				if(count<= comparador)
				pwm_out <= 1;
				else
				pwm_out <=0; 
			end 
	end




endmodule 