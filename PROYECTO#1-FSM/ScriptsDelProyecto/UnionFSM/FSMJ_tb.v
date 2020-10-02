module BANCODEPRUEBA();
reg CLK1, CLK2;
reg[1:0] M;
wire taima;
wire[2:0]count;


timmer TIMA(CLK1,M,taima, count);
//Clock para las FSM
initial begin
  CLK1 = 0;
  forever #1 CLK1 = ~CLK1; //cambio ininterrumpido del CLOCK durante todo el tiempo.
end

//Clock para los contadores
initial begin
  CLK2 = 0;
  forever #10 CLK2 = ~CLK2; //para cambiar el clock de forma ininterrumpida
end

initial begin
M = 2'b00;
#10 M = 2'b01;
end

initial begin
#100 $finish;
end

initial begin
$dumpfile ("FSMJ_tb.vcd");
$dumpvars (0, BANCODEPRUEBA);

end
endmodule
