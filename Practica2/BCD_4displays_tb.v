module BCD_4displays_tb();
	reg [9:0] bcd_in;
	wire [6:0] D_un, D_de, D_ce, D_mi;
	
	
BCD_4displays DUT (
		.bcd_in(bcd_in),
		.D_un(D_un),
		.D_de(D_de),
		.D_ce(D_ce),
		.D_mi(D_mi)
	);
	
initial
begin 
	$display("Simulacion 1023");
	repeat(10)
		begin
			bcd_in = $random % 1024;
			#10;
		end
	$stop;
	$finish;
end

initial 
begin
    $monitor("Entrada=%d, bcd_in=%b, M=%d, C=%d, D=%d, U=%d", bcd_in, bcd_in, D_mi, D_ce, D_de, D_un);
end

endmodule 
