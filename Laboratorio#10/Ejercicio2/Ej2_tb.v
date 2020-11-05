module testbench();
reg CLK,reset,Enbusin,Enbusout,Enaccu;
reg [2:0] selAlu;
reg [3:0] dataIn;
wire [1:0]CarryZero;
wire [3:0]BusdeSalida;
wire [3:0]ACCUactual;

Interconexion ej2(.Acum(ACCUactual),.SALBUSOut(BusdeSalida),.CZ(CarryZero),.INBUS(dataIn),.selectorALU(selAlu),.ENAccu(Enaccu),.ENBusIn(Enbusin),.ENBusOut(Enbusout),.clk(CLK),.reset(reset));

initial begin
  CLK= 0;
  forever #1 CLK = ~CLK;
end


initial begin
reset = 1; Enbusin = 0; Enbusout = 0; Enaccu = 0; selAlu = 3'b000; dataIn = 4'b0011;
#1 reset = 0;
#1 Enaccu = 1; selAlu = 3'b010; //prueba dejar pasar B
#2 Enbusin = 1;
#2 Enbusout = 1; Enaccu = 0; dataIn = 4'b1010;
#1 selAlu = 3'b100; //prueba NAND
#2 selAlu = 3'b011; //prueba suma
#2 selAlu = 3'b000; //prueba pasa el valor de A
#2 selAlu = 3'b001; //resta de los valores
#9 dataIn = 4'b1100; selAlu = 3'b010; Enaccu = 1;//Pasa un nuevo valor a A
#2 Enaccu = 0;
#2 selAlu = 3'b001;//resta de los valores
#2 dataIn = 4'b0011; Enaccu = 1;//cambio de valor, nueva resta
#2 Enaccu = 0;//Nuevo valor en el accu, se hace una resta distinta
end

initial begin
  #100 $finish;
end

initial begin
$dumpfile("Ej2_tb.vcd");
$dumpvars(0, testbench);
end

endmodule
