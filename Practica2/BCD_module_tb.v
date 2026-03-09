module BCD_module_tb();
	reg [3:0] bcd_in;
	wire [6:0] bcd_out;

// Pruebas aleatorias
initial
begin 
	$display("Simulacion");
	repeat(10)
		begin
			bcd_in = $random % 16;
			#10;
		end
	$stop;
	$finish;
end

initial 
begin
    $monitor("bcd_in=%0d", bcd_in);
end

endmodule