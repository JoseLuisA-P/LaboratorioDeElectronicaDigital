module BancoDePrueba();
reg Cafe, Te, Leche, Agua, Nada, Vainilla;
reg RESET, CLK, CLK2;
wire [3:0]Sactual;
wire [3:0]Sfuturo;

SFMSelector fs1(RESET, CLK, Cafe, Te, Leche, Agua, Nada, Vainilla, Sactual, Sfuturo);

//CLOCK 1, para las FSM
initial begin
  CLK = 0;
  forever #1 CLK = ~CLK; //cambio ininterrumpido del CLOCK durante todo el tiempo.
end

//CLOCK2, para los timmers asumido en segundos
initial begin
  CLK2 = 0;
  forever #10 CLK2 = ~CLK2;//cambio ininterrumpido del CLOCK 2 durante todo el tiempo
end
///////////////////////////////////////////////////////////////////////////////
initial begin
//primera prueba
RESET = 1; Cafe = 0; Te= 0; Leche= 0; Agua = 0; Nada = 0; Vainilla = 0;
#1 RESET = 0; Cafe = 1; Te = 1; Leche =1; Agua =1; Nada =1; Vainilla =1;
#2 Cafe = 0; Te = 0; Leche =0; Agua = 0; Nada =0; Vainilla =0;
#3 Cafe = 1; Te = 1;
#2 Te= 0;
#2 Cafe= 0; Leche= 1; Agua = 1;
#2 Leche = 0; Agua = 0;
#2 Leche = 1;
#2 Nada = 1; Vainilla = 1;
#2 Nada = 0; Vainilla = 0;
#2 Nada = 1;
#2 Nada = 0;

end
///////////////////////////////////////////////////////////////////////////////
initial begin
  #100 $finish;
end

initial begin
$dumpfile ("FSMproy1_tb.vcd");
$dumpvars (0, BancoDePrueba);

end

endmodule
