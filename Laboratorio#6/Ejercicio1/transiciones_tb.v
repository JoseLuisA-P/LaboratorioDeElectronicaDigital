module testbench();
reg A, B;
wire [1:0] Y;
wire Msal;
reg reset;
reg clk;

  EJ1 sinc(clk, reset, A, B, Msal, Y);

initial begin
//bloque para generar el reloj, inicia en 0 y cada 10 unidades de tiempo
//cambia su estado.
  clk = 0;
      forever #10 clk = ~clk; //corre durante toda la simulacion, de inicio
                              // a final, no se interrumpe
end

initial begin
  reset = 1;
  A = 0;
  B = 0;
  #5;
  reset = 0;
  A = 1;
  #30;
  B = 1;
  #70;
  A = 0;
  #10;
  A = 1;
  #40;
  B = 0;
end

initial begin
  #200 $finish;
end


initial begin
$dumpfile("transiciones_tb.vcd");
$dumpvars(0,testbench);
end

endmodule
