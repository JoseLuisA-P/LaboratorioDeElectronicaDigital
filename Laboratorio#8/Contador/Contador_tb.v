module testbench();
//vraibles asociadas al contador
reg RESET,clk,LOAD,ENABLE;
reg[11:0] DLOAD;
wire[11:0] Y;
//modulo del contador creado en el testbench
Contador conteo(RESET, clk, LOAD, ENABLE, DLOAD, Y);
//ciclo de reloj para alternarlo cada unidad de tiempo, tiene un periodo de 2 unidades de tiempo
initial begin
clk = 0;
forever #1 clk = ~clk;
end
//asignacion de variables para probar el contador
initial begin
RESET = 1; LOAD = 0; ENABLE = 0; DLOAD = 12'b000000111100;
#1 RESET = 0;
#1 ENABLE = 1;
#20 ENABLE = 0;
#20 LOAD = 1;
#1 LOAD = 0;
#1 ENABLE = 1;
#20 ENABLE = 0;
#10 RESET = 1;
#1 RESET = 0;
end
//terminar la simulacion
initial begin
#100 $finish;
end
//datos y archivo para ser interpretado en GTKWAVE
initial begin
$dumpfile("Contador_tb.vcd");
$dumpvars(0, testbench);
end

endmodule
