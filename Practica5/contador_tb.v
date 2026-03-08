module contador_tb();
    reg clk;
    reg rst;
    wire [19:0] count;
    
    // Instancia del DUT con CMAX=1000
    contador #(1000) DUT(
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Generador de reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // periodo de 10 ns
    end

    // Estímulos
    initial begin
        $display("Simulacion iniciada");
        rst = 1;
        #10 rst = 0;   // quitamos reset
        #10000;        // dejamos correr suficiente tiempo
        $stop;
    end

    // Monitor
    initial begin
        $monitor("t=%0t | CLK=%b | rst=%b | Count=%d", $time, clk, rst, count);
    end

endmodule