module top_tb();
	reg CLK;
	reg rst;
	reg up_down;
	reg load;
	reg [6:0] data_in;
	wire [6:0] HEX0;
	wire [6:0] HEX1;
	wire [6:0] HEX2;
	wire [6:0] count;
	
top DUT(
	.CLK(CLK),
	.rst(rst),
	.up_down(up_down),
	.load(load),
	.data_in(data_in),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2)
);

Contador100 DUT1(
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
		up_down=1;
		#10;
		up_down=0;
		#10;
		load=1;
		data_in=63;
		#10
		load=0;
end


initial
	begin
		$monitor("CLK=%b, rst=%b, Up_down=%b, load=%b, data_in=%d, count=%d", CLK, rst, up_down, load, data_in,count);
		end

endmodule 



