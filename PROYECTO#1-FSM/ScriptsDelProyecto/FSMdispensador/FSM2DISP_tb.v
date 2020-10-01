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
  //timming 1, transicioines del estado 0 al 1 y restricciones
  RESET = 1; E = 0; A = 0; B = 0; C = 0; CIN = 3'b000; SA = 4'b0000;
  #1 RESET = 0; SA = 4'b0100; CIN = 3'b001; E = 1;
  #1 CIN = 3'b011;
  #1 CIN = 3'b010;
  #1 CIN = 3'b110;
  #2 SA = 4'b1100;
  #2 SA = 4'b1000;
  #5 RESET = 1; CIN = 3'b111; SA = 4'b1000;
  #1 RESET = 0;
  #5 RESET = 1; SA = 4'b1100;
  #1 RESET = 0;

  //timming 2, transiionces del estado 0 al 2 y restricciones
  #7 RESET = 1;
  #1 RESET = 0; SA = 4'b0101; CIN = 3'b001; E = 1;
  #1 CIN = 3'b011;
  #1 CIN = 3'b010;
  #1 CIN = 3'b110;
  #2 SA = 4'b1101;
  #2 SA = 4'b1001;
  #5 RESET = 1; CIN = 3'b111; SA = 4'b1001;
  #1 RESET = 0;
  #5 RESET = 1; SA = 4'b1101; E = 0;
  #1 RESET = 0;

  //timming 3, transiciones del estado 3 al 4, del 4 al 6 y luego al 7
  #2 CIN = 3'b111; SA = 4'b1000; E = 1;
  #6 A = 1;
  #6 B = 1;
  #9 RESET = 1; A = 0; E = 0; B = 1;
  #1 RESET = 0;

  //timming 4, transiciones del estado 3 al 5
  #4 CIN = 3'b111; SA = 4'b1010; E = 1;
  #6 A = 1;
  #6 B = 1;
  #9 RESET = 1; A = 0; E = 0; B = 0;
  #1 RESET = 0;

  //timming 5, transiciones del estado con total dispensado
  #4 CIN = 3'b111; SA = 4'b1100; E = 1;
  #6 A = 1;
  #6 B = 1;
  #6 C = 1;
  #9 RESET = 1; A = 0; E = 0; B = 0; C = 0;
  #1 RESET = 0;

  //timming 6, transiciones de los estados con total dispensado
  #4 CIN = 3'b111; SA = 4'b1111; E = 1;
  #6 A = 1;
  #6 B = 1;
  #6 C = 1;
  #9 RESET = 1; A = 0; E = 0; B = 0; C = 0;
  #1 RESET = 0;

  end

  initial begin
  #200 $finish;
  end

  initial begin
  $dumpfile ("FSM2DISP_tb.vcd");
  $dumpvars (0, BancoDePrueba);

  end

endmodule
