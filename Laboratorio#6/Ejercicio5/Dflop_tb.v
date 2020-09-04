module testbench();
//variables a utilizar para el flipflop
reg[3:0] D; // ya que no se utilizan valores de asignacion continua
reg clk;    // se asignan como registros
reg reset;
reg set;
wire[3:0] Y; // cable que si acepta asignacion continua (mantiene el valor de la salida del FF)

Dflop df1(clk, reset, set, D, Y); //para crear el flip flop

initial begin
//bloque para generar el reloj, inicia en 0 y cada 10 unidades de tiempo
//cambia su estado.
  clk = 0;
      forever #10 clk = ~clk; //corre durante toda la simulacion, de inicio
                              // a final, no se interrumpe
end

initial begin
  reset = 1;
  set= 0;
  #20;
  reset = 0;
  set = 1;
  #50;
  set = 0; reset = 0; D = 4'b0010;
  #50;
  D = 4'b1110;
  #50;
  D = 4'b1010;
  #50;
  reset = 1; D = 4'b1010;
  #20;
  set = 1; reset = 0; D = 4'b0101;
  #20;
  set = 0; D = 4'b0101;
end

initial begin
//para terminar la simulacion
  #300 $finish;
end

initial begin
$dumpfile("Dflop_tb.vcd");
$dumpvars(0,testbench);
end

endmodule
