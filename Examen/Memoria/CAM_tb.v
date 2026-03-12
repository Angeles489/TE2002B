module CAM_tb();
    reg clk;
    reg rst;
	 reg [3:0] addr_tb;
    wire [5:0] data_out; 
    wire [0:6] HEX0, HEX1, HEX2, HEX3;

CAM #(.DATA_WIDTH(6),.ADRR_WIDTH(4)) dut (
        .clk(clk),
        .rst(rst),
		  .addr(addr_tb),
        .data_out(data_out),
        .HEX0(HEX0), 
		  .HEX1(HEX1), 
		  .HEX2(HEX2), 
		  .HEX3(HEX3)
    );

always begin
     #10 clk = ~clk;
end

initial begin
	clk = 0;
	rst = 1; 
   addr_tb=0;
	
   #20;     
   rst = 0; 
      
	
	repeat(16) begin
		@(posedge clk);
		#5;
		addr_tb=addr_tb+1;
	end
	
		#50;
        
        $display("Mayor:%d", dut.numero_mayor);
		  $display("Menor:%d", dut.numero_menor);
        $stop;  
    end
	
initial begin
    $monitor("address=%d, data_out=%d ,mayor=%d, menor=%d",addr_tb, data_out, dut.numero_mayor, dut.numero_menor);
end

endmodule