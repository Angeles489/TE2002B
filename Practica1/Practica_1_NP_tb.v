module Practica_1_NP_tb();

// Variables
reg [3:0] Switch;
wire LED;

Practica_1_NP DUT(
	.Switch(Switch),
	.LED(LED)
);


initial 
	begin
	$display("Simulacion");
	Switch= 4'b0000; #10
	Switch= 4'b0001; #10
	Switch= 4'b0010; #10
	Switch= 4'b0011; #10
	Switch= 4'b0100; #10
	Switch= 4'b0101; #10
	Switch= 4'b0110; #10
	Switch= 4'b0111; #10
	Switch= 4'b1000; #10
	Switch= 4'b1001; #10
	Switch= 4'b1010; #10
	Switch= 4'b1011; #10
	Switch= 4'b1100; #10
	Switch= 4'b1101; #10
	Switch= 4'b1110; #10
	Switch= 4'b1111; #10

	$stop;
	$display("Fin");
	$finish;
end

initial
		begin
			$monitor("Switch=%b, LED=%b", Switch, LED);
end

endmodule
	