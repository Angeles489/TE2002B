module CAM_w#(
	parameter DATA_WIDTH = 6,
	parameter ADRR_WIDTH = 4
	
) (
	input MAX10_CLK1_50,
	input [1:0] KEY,
	output [0:6] HEX0,
	output [0:6] HEX1,
	output [0:6] HEX2,
	output [0:6] HEX3
	);
	
	
  reg [ADRR_WIDTH-1:0] contador_addr;
			 
always @(posedge MAX10_CLK1_50 or negedge KEY[0]) begin 
	if(!KEY[0])
		contador_addr<=0;
			else  
				contador_addr <= contador_addr + 1;
		end

	
	
CAM #( .DATA_WIDTH(DATA_WIDTH), .ADRR_WIDTH(ADRR_WIDTH) ) DUT(
	.clk(MAX10_CLK1_50),
	.rst(~KEY[0]),
	.addr(contador_addr),
	.data_out(data_out),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3)
	
);




endmodule