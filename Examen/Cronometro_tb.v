
module Cronometro_tb ();
	reg clk;
	reg pausa;
	reg rst;
	wire [6:0] mc,md,mu,un,de;
	
Cronometro DUT(
	.clk(clk),
	.pausa(pausa),
	.rst(rst),
	.HEX0(mc),
	.HEX1(md),
	.HEX2(mu),
	.HEX3(un),
	.HEX4(de)
);

always #10 clk= ~clk;

initial 
	begin
			clk=0;
			rst=1;
			pausa=0;
			
			#50;
			rst=0;
			
			#100;
			pausa=1;
			
			#200;
			pausa=0;
			
			#5000000;
			
			$stop;
			$finish;
	end
	
	
initial
	begin
		$monitor("Dec: %d, Un:%d, Mu:%d, Md:%d, Mc:%d ", DUT.decenas, DUT.unidades, DUT.m_uni, DUT.m_dec, DUT.m_cen);
		
    end
endmodule
			
