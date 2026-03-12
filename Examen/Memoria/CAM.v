module CAM #(
	parameter DATA_WIDTH = 6,
	parameter ADRR_WIDTH = 4
) (
		input wire clk,
		input wire rst,
		input wire [ADRR_WIDTH-1:0] addr,
		output [DATA_WIDTH-1:0] data_out,
		output [0:6] HEX0,
		output [0:6] HEX1,
		output [0:6] HEX2,
		output [0:6] HEX3
);

reg [DATA_WIDTH-1:0] MEMORY [0:2**ADRR_WIDTH-1];

initial
begin
	$readmemh("memo.hex", MEMORY);
end

assign data_out = MEMORY[addr];

reg [DATA_WIDTH-1:0] numero_mayor;
reg [DATA_WIDTH-1:0] numero_menor;


always @(posedge clk or posedge rst) 
	begin
	if(rst)
		begin
			numero_mayor<=0;
			numero_menor<={DATA_WIDTH{1'b1}};
			end
	else
	begin
			if(data_out > numero_mayor)
				numero_mayor <= data_out;
			if(data_out < numero_menor)
				numero_menor <=data_out;
		end

	end
		
BCD_4displays #(.N_in(DATA_WIDTH),.N_out(7)) menor (.bcd_in(numero_menor),.D_un(HEX0),.D_de(HEX1));
BCD_4displays #(.N_in(DATA_WIDTH),.N_out(7)) mayor (.bcd_in(numero_mayor),.D_un(HEX2),.D_de(HEX3));

endmodule



