module testbench();
reg[n-1:0] A;
reg[n-1:0] B;
reg[2:0] selector;
wire[n-1:0] Y;

parameter n = 4; //parametro para el modulo

ALU #(.N(n)) modALU (selector, A, B, Y); //instanciando el modulo de al ALU y
//sobreescribiendo el valor del parametro declarado

initial begin
//declarando los valores de A y B y haciendo que el selector aumente para probar los casos.
A = 1;
B = 4;
selector = 0;
forever #1 selector = selector + 1;
end

//terminar el ciclo luego de 10 unidades de tiempo
initial begin
  #10 $finish;
end

//datos de GTKWAVE
initial begin
$dumpfile("ALU_tb.vcd");
$dumpvars(0, testbench);
end

endmodule //
