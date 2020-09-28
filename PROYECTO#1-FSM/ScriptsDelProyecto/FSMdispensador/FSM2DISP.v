///////////////////////////////////////////////////////////////////////////////
///Jose Luis Alvarez Pineda
///19392
///Electronica digital
///Proyecto 1
///FSM del dispensador
///////////////////////////////////////////////////////////////////////////////

//implementacion de un FF con solo reset asincrono y es del tipo D
module Dflop(
  input wire areset, clk,
  input wire [3:0] D,
  output reg [3:0] Y);

    always @ ( posedge clk, posedge areset) begin
      if (areset) Y <= 4'b0000;
      else Y <= D;
    end

endmodule

////////////////////////////////////////////////////////////////////////////////
module FSMdisp(
  input wire RESET, CLK,
  input wire E, A, B, C,
  input wire [2:0] CIN,
  output wire [1:0] M1,
  output wire [1:0] M2,
  output wire M3,Li,
  output wire [2:0] IND,
  output wire [3:0]S,
  output wire [3:0]Sf);

  Dflop FF1estado (RESET, CLK, Sf, S);

//estados futuros de la maquina de dispensar


//salidas de la maquina de dispensar
endmodule
