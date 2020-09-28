module BancoDePrueba();
reg Cafe, Te, Leche, Agua, Nada, Vainilla;
reg RESET, CLK, CLK2;
wire [3:0]Sactual;
wire [3:0]Sfuturo;
wire [3:0]SA;

SFMSelector fs1(RESET, CLK, Cafe, Te, Leche, Agua, Nada, Vainilla, Sactual, Sfuturo, SA);

//CLOCK 1, para las FSM
initial begin
  CLK = 0;
  forever #1 CLK = ~CLK; //cambio ininterrumpido del CLOCK durante todo el tiempo.
end

///////////////////////////////////////////////////////////////////////////////
initial begin
//primera prueba, timming 1
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

//segunda prueba, timming 2
#10 RESET = 1; Leche = 0;
#2 RESET = 0;
#2 Cafe = 1;
#4 RESET = 1;
#1 Cafe = 0;
#1 RESET = 0;
#2 Te = 1;
#4 RESET = 1;
#1 Te = 0;
#1 RESET = 0;

//tercera prueba, timming 3
#10 Cafe = 1;
#4 Cafe = 0; Leche = 1;
#4 RESET = 1; Leche = 0;
#2 Cafe = 1; RESET = 0;
#4 Cafe = 0; Agua = 1;
#2 RESET = 1; Agua = 0;
#2 RESET = 0;

//cuarta prueba, timming 4
#10 Te= 1;
#4 Te = 0; Leche = 1;
#4 RESET = 1; Leche = 0;
#2 Te = 1; RESET = 0;
#4 Te= 0; Agua = 1;
#2 RESET = 1; Agua = 0;
#2 RESET = 0;

//quinta prueba, timming 5
#10 Cafe = 1;
#4 Cafe = 0; Leche = 1;
#2 Leche = 0; Nada = 1;
#4 RESET = 1; Nada = 0;
#2 RESET = 0;
#8 Cafe = 1;
#4 Cafe = 0; Leche = 1;
#2 Leche = 0; Vainilla = 1;
#4 RESET = 1; Vainilla = 0;
#2 RESET = 0;

#10 Cafe = 1;
#4 Cafe = 0; Agua = 1;
#2 Agua = 0; Nada = 1;
#4 RESET = 1; Nada = 0;
#2 RESET = 0;
#8 Cafe = 1;
#4 Cafe = 0; Agua = 1;
#2 Agua = 0; Vainilla = 1;
#4 RESET = 1; Vainilla = 0;
#2 RESET = 0;

//sexta prueba, timming 6
#10 Te = 1;
#4 Te = 0; Leche = 1;
#2 Leche = 0; Nada = 1;
#4 RESET = 1; Nada = 0;
#2 RESET = 0;
#8 Te = 1;
#4 Te = 0; Leche = 1;
#2 Leche = 0; Vainilla = 1;
#4 RESET = 1; Vainilla = 0;
#2 RESET = 0;

#10 Te = 1;
#4 Te = 0; Agua = 1;
#2 Agua = 0; Nada = 1;
#4 RESET = 1; Nada = 0;
#2 RESET = 0;
#8 Te = 1;
#4 Te = 0; Agua = 1;
#2 Agua = 0; Vainilla = 1;
#4 RESET = 1; Vainilla = 0;
#2 RESET = 0;

//Septima prueba, timing 7
#6 Cafe = 1; Leche = 1; Nada = 1;
#8 RESET = 1; Nada = 0;
#2 RESET =0; Vainilla = 1;
#8 RESET =1; Vainilla = 0;
#2 RESET = 0; Cafe = 0; Leche = 0;

//Octava prueba, timing 8
#6 Cafe = 1; Agua = 1; Nada = 1;
#8 RESET = 1; Nada = 0;
#2 RESET =0; Vainilla = 1;
#8 RESET =1; Vainilla = 0;
#2 RESET = 0; Cafe = 0; Agua = 0;

//Septima prueba, timing 9
#6 Te = 1; Leche = 1; Nada = 1;
#8 RESET = 1; Nada = 0;
#2 RESET =0; Vainilla = 1;
#8 RESET =1; Vainilla = 0;
#2 RESET = 0; Te = 0; Leche = 0;

//Octava prueba, timing 10
#6 Te = 1; Agua = 1; Nada = 1;
#8 RESET = 1; Nada = 0;
#2 RESET =0; Vainilla = 1;
#8 RESET =1; Vainilla = 0;
#2 RESET = 0; Te = 0; Agua = 0;

end
///////////////////////////////////////////////////////////////////////////////
initial begin
  #400 $finish;
end

initial begin
$dumpfile ("FSMproy1_tb.vcd");
$dumpvars (0, BancoDePrueba);

end

endmodule
