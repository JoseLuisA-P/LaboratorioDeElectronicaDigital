module testbench();
//variables a utilizar para el contador gray
reg[2:0] D; // ya que no se utilizan valores de asignacion continua
reg clk;    // se asignan como registros
reg reset;
reg A;
wire[2:0] Y; // cable que si acepta asignacion continua (mantiene el valor de la salida del FF)

EJ3 cont1(clk, reset, A, Y);// objeto de contador

initial begin
//bloque para generar el reloj, inicia en 0 y cada 10 unidades de tiempo
//cambia su estado.
  clk = 0;
      forever #10 clk = ~clk; //corre durante toda la simulacion, de inicio
                              // a final, no se interrumpe
end

initial begin
  reset = 1;
  A = 1;
  #5;
  reset = 0;
  #50 A = 0;
  #50 A = 1;
  #100 A = 0;
  #200 A = 1;
end

initial begin
//para terminar la simulacion
  #500 $finish;
end

initial begin
$dumpfile("contador_tb.vcd");
$dumpvars(0,testbench);
end

endmodule
