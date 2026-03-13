`timescale 1ns/1ps

module practica4_tb();

    reg clk;
    reg [3:0] SW;
    reg [1:0] KEY;
    wire [0:6] HEX0, HEX1, HEX2, HEX3;
	 
    practica4 #(.BIT_SEL(1)) dut (
        .clk(clk),
        .SW(SW),
        .KEY(KEY),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .HEX3(HEX3)
    );

    // Generador de reloj de 50MHz (Periodo de 20ns)
    always #10 clk = ~clk;
	 
    task press_check;
        begin
            #200;       
            KEY[1] = 0; 
            #400;       
            KEY[1] = 1; 
            #400;       
        end
    endtask

    initial begin
        // --- 1. Inicialización ---
        clk = 0;
        SW = 4'h0;
        KEY = 2'b11; 
        
        #100;
        KEY[0] = 0; // Presiona Reset
        #100;
        KEY[0] = 1; // Suelta Reset
        #200;

        $display("--- Iniciando Prueba de Password: 1 - 4 - 5 - 1 ---");

       
        
        // Dígito 1 (password[3:0] = 1)
        SW = 4'h1; 
        press_check();
        $display("Estado despues de SW=1: %d",  dut.state);

        // Dígito 2 (password[7:4] = 4)
        SW = 4'h4; 
        press_check();
        $display("Estado despues de SW=4: %d",  dut.state);

        // Dígito 3 (password[11:8] = 5)
        SW = 4'h5; 
        press_check();
        $display("Estado despues de SW=5: %d", dut.state);

        // Dígito 4 (password[15:12] = 1)
        SW = 4'h1; 
        press_check();
        $display("Estado final: %d", dut.state);

        // --- 4. Verificación Final ---
        #500;
        if (dut.state == 3'd4) 
            $display(">>> RESULTADO: EXITOSO (Estado GOOD) <<<");
        else 
            $display(">>> RESULTADO: FALLIDO (Estado actual: %d) <<<", dut.state);

        $stop;
    end

    // Monitor para ver los cambios en la consola de ModelSim
    initial begin
        $monitor("State=%d | Next=%d | SW=%h | Check=%b", 
                 dut.state, dut.next, SW, KEY[1]);
    end

endmodule