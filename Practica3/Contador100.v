//Práctica 3: Contador a 100
module Contador100 #(parameter CMAX=100)(
	input CLK,
	input rst,
	//entrada up_down
	input up_down,
	// entrada numero
	input [6:0] data_in,
	//entrada botón
	input load,
	output reg [6:0] count
);

 
always @(posedge CLK or posedge rst) 
		begin
				if(rst)
					count<=0;
				//else
			//	begin 
				//data_in
							else if(load)
				//				begin
									count<=data_in;
					//			end
					//Ascendente 
					else begin
					if(up_down)
						begin 							
							if(count==CMAX)
								count<=0;
						
						else 
								count<= count +1;
						end
						
					else begin
								if(count==0)
								count<=CMAX;
							else
								count<= count -1; 
					end
			end
	end 
	
endmodule 