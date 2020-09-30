module BancoDePrueba();
  reg CLK, CLK2, RESET;
  reg [3:0] SA;
  reg E, A, B, C;
  reg [2:0] CIN;
  wire [3:0] Sactual;
  wire [3:0] Sfuturo;
  wire Li, M3;
  wire [1:0] M1;
  wire [1:0] M2;
  wire [2:0] IND;

  FSMdisp FSM2disp(RESET, CLK, E, A, B, C, SA, CIN, M1, M2, M3, Li, IND, Sactual, Sfuturo);

  //Clock para las FSM
  initial begin
    CLK = 0;
    forever #1 CLK = ~CLK; //cambio ininterrumpido del CLOCK durante todo el tiempo.
  end

  //Clock para los contadores
  initial begin
    CLK2 = 0;
    forever #10 CLK2 = ~CLK2; //para cambiar el clock de forma ininterrumpida
  end


  initial begin
  RESET = 1; E = 0; A = 0; B = 0; C = 0; CIN = 3'b000; SA = 4'b0000;
  #1 RESET = 0; SA = 4'b1111; CIN = 3'b111;
  #3 E = 1;
  end

  initial begin
  #100 $finish;
  end

  initial begin
  $dumpfile ("FSM2DISP_tb.vcd");
  $dumpvars (0, BancoDePrueba);

  end

endmodule
