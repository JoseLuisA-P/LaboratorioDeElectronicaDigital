module testbench();
//variables a utilizar para el flipflop
reg[3:0] D; // ya que no se utilizan valores de asignacion continua
reg clk;    // se asignan como registros
reg reset;
wire[3:0] Y; // cable que si acepta asignacion continua (mantiene el valor de la salida del FF)

Dflop df1(clk, reset, D, Y); //para crear el flip flop


initial begin
//bloque para generar el reloj, inicia en 0 y cada 10 unidades de tiempo
//cambia su estado.
  clk = 0;
      forever #10 clk = ~clk; //corre durante toda la simulacion, de inicio
                              // a final, no se interrumpe
end

initial begin
  $monitor("%b %b %b",reset,clk,Y);
  reset = 1;
  #38 reset = 0; D = 4'b0010;
  #48 reset = 0; D = 4'b1110;
  #68 reset = 0; D = 4'b1010;
end

initial begin
//para terminar la simulacion
  #200 $finish;
end
endmodule
