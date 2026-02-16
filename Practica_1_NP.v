module Practica_1_NP(
	input [3:0] Switch,
	output reg LED );
	
always @(*)
	begin
		case(Switch)
			4'b0010 : LED=1;
			4'b0011 : LED=1;
			4'b0101 : LED=1;
			4'b0111 : LED=1;
			4'b1011 : LED=1;
			4'b1100 : LED=1;
			default : LED=0;
		endcase
	end
		
endmodule 
		
	