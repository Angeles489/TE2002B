module Cronometro(
	input clk,
	input rst,
	input pausa,
	output [0:6]  HEX0,HEX1,HEX2,HEX3,HEX4
);

reg [3:0] decenas, unidades, m_uni, m_dec, m_cen; 
wire clk_d;

CLK_divider #(.FREQ(10000)) DIV (
        .CLK(clk),
        .rst(rst),
        .CLK_div(clk_d) 
    );

always @(posedge clk_d or posedge rst)
	begin
		if(rst)begin
		decenas<=0;
		unidades<=0;
		m_uni<=0;
		m_dec<=0;
		m_cen<=0;
				end
		else
			if(!pausa)begin
				if(m_cen == 9) begin
					m_cen<=0;
						if(m_dec == 9) begin
							m_dec<=0;
								if(m_uni == 9) begin
										m_uni<=0;
											if(unidades == 9) begin
												unidades<=0;
													if(decenas == 5) 
														decenas<=0;
													else 
														decenas<= decenas+1;
												end //decenas
											else
												unidades<= unidades+1;
										end //unidades
									else
										m_uni <= m_uni+1;
									end //m_uni
								else
									m_dec <= m_dec+1;
								end // m_dec
							else
								m_cen <= m_cen+1;
						end //m_cen
					end
					
BCD_module mc (.bcd_in(m_cen),.bcd_out(HEX0));
BCD_module md (.bcd_in(m_dec),.bcd_out(HEX1));
BCD_module mu (.bcd_in(m_uni),.bcd_out(HEX2));
BCD_module un (.bcd_in(unidades),.bcd_out(HEX3));
BCD_module de (.bcd_in(decenas),.bcd_out(HEX4));
					
endmodule 
									
												