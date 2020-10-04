module BANCODEPRUEBA();

//variables globales para todas las maquinas
reg CLK1, CLK2;
reg RESET;
reg ResetManual;

///variables asociadas a los contadores
wire taima, taimb,taimc;
wire[2:0]counta;
wire[2:0]countb;
wire[2:0]countc;

///variables asociadas al dispensador
reg E;
wire[3:0] FuturosDispensador;
wire[3:0] ActualesDispensador;
reg [2:0] CIN;
wire [3:0] SA;
wire [1:0] M1;
wire [1:0] M2;
wire M3, Li;
wire [2:0] LCD;

//variables asociadas al selector
reg C,T,L,A,N,V;
wire [3:0]FuturosSelector;
wire [3:0]ActualesSelector;

//modulos asociados a las FMS
SFMSelector selector(RESET, CLK1, C, T, L, A, N, V, ActualesSelector, FuturosSelector, SA);
FSMdisp dispensador(RESET, CLK1, E, taima, taimb, taimc, SA, CIN, M1, M2, M3, Li, LCD, ActualesDispensador, FuturosDispensador);

//modulos asociados a los timmers
timmerA TIMA(CLK2,RESET,M1,taima, counta);
timmerB TIMB(CLK2,RESET,M2,taimb, countb);
timmerC TIMC(CLK2,RESET,M3,taimc, countc);

//logica secuencial para la asignacion de valores a un registro al momento de actualizarse
always @ ( posedge Li ,posedge ResetManual, posedge CLK1) begin
  RESET <= 0; //para que el reset se mantenga en 0 de no presionar nada

  if(Li == 1)begin//asignar el valor de LI al reset cuando se active
  RESET <= Li;
  end

  else if(ResetManual == 1) begin //asignar el valor del reset manual al reset.
  RESET <= ResetManual;
  end
end

//Clock para las FSM
initial begin
  CLK1 = 0;
  forever #1 CLK1 = ~CLK1; //cambio ininterrumpido del CLOCK durante todo el tiempo.
end

//Clock para los contadores
initial begin
  CLK2 = 0;
  forever #4 CLK2 = ~CLK2; //para cambiar el clock de forma ininterrumpida
end

initial begin
ResetManual = 1;
#1 ResetManual = 0; E = 0; C = 0; T = 0; A = 0; L = 0; N = 0; V = 0; CIN = 3'b000;
#3 C = 1;
#2 C = 0; L = 1;
#3 L = 0; V = 1;
#2 V = 0; CIN = 3'b111;
#3 E = 1;
#2 E = 0;
end

initial begin
#500 $finish;
end

initial begin
$dumpfile ("FSMJ_tb.vcd");
$dumpvars (0, BANCODEPRUEBA);

end
endmodule
