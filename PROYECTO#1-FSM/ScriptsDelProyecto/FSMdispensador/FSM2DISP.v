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
  input wire [3:0] SA,
  input wire [2:0] CIN,
  output wire [1:0] M1,
  output wire [1:0] M2,
  output wire M3,Li,
  output wire [2:0] IND,
  output wire [3:0]S,
  output wire [3:0]Sf);

  Dflop FF1estado (RESET, CLK, Sf, S);

//estados futuros de la maquina de dispensar
assign Sf[3] = (S[3] & ~S[2] & ~S[1]) | (~S[3] & S[2] & S[1] & ~S[0] & SA[2]);

assign Sf[2] = (~S[3] & S[2] & ~S[1]) | (~S[3] & S[1] & S[0]) | (~S[3] & S[2] & ~SA[2]);

assign Sf[1] = (~S[3] & S[2] & S[1] & S[0]) | (~S[3] & ~S[2] & S[1] & ~S[0]) |
                (~S[3] & S[2] & ~S[1] & B) | (~S[3] & ~S[2] & ~S[1] & S[0] & A) |
                (~S[3] & ~S[2] & ~S[0] & SA[3] & ~SA[2] & SA[0] & CIN[2] & CIN[1] & E) |
                (~S[3] & ~S[2] & ~S[0] & SA[3] & SA[0] & CIN[2] & CIN[1] & CIN[0] & E) |
                (~S[3] & S[1] & ~S[0] & ~SA[2]);

assign Sf[0] = (~S[2] & ~S[1] & S[0]) | (~S[3] & S[2] & S[1] & S[0]) | (~S[3] & S[2] & S[1] & ~SA[2]) |
                (S[3] & ~S[2] & ~S[1] & C) | (~S[3] & ~S[2] & S[1] & ~S[0] & A) |
                (~S[3] & ~S[2] & ~S[1] & SA[3] & ~SA[2] & ~SA[0] & CIN[2] & CIN[1] & E) |
                (~S[3] & ~S[2] & ~S[1] & SA[3] & ~SA[0] & CIN[2] & CIN[1] & CIN[0] & E) |
                (~S[3] & S[1] & S[0] & SA[1]) | (~S[3] & ~S[1] & S[0] & ~B) ;
//salidas de la maquina de dispensar
assign M1[1] = ;
assign M1[0] = ;
assign M2[1] = ;
assign M2[0] = ;
assign M3 = ;
assign Li = ;
assign IND[2] = ;
assign IND[1] = ;
assign IND[0] = ;
endmodule
