module Contador100_tb();
	reg CLK;
	reg rst;
	wire [6:0] count;
	
	
Contador100 DUT(
	.CLK(CLK),
	.rst(rst),
	.count(count)
);


initial
	begin
		CLK=0;
		forever #5
		CLK= ~CLK;
end

initial 
	begin 
		$display("Simulacion");
		rst=1;
		#100
		rst=0;
		#1000
		$stop;
		$finish;
end 


initial
	begin
		$monitor("CLK=%b, rst=%b, Count=%d", CLK, rst, count);
		end

endmodule 

