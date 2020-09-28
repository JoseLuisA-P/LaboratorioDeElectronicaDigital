///////////////////////////////////////////////////////////////////////////////
///Jose Luis Alvarez Pineda
///19392
///Electronica digital
///Proyecto 1
///FSM del selector
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
//IMPLEMENTACION DE LA FSM DE EL SELECTOR
module SFMSelector(
  input areset,clk,
  input wire C,T,L,A,N,V,
  output wire [3:0]S,
  output wire [3:0]Sf,
  output wire [3:0]SA);

 Dflop FF1 (areset, clk, Sf, S);

//SON LOS ESTADOS FUTUROS INTERNOS DE LA MAQUINA
 assign Sf[3] = (S[3] & ~S[2]) | (S[3] & ~S[1]) | (S[3] & ~S[0]) |(~S[2] & ~S[1] & ~S[0] & ~C & T);

 assign Sf[2] = (~S[3] & S[2]) | (S[2] & ~S[1]) | (S[2] & ~S[0]) | (~S[3] & S[1] & ~N & V)
                | (S[1] & ~S[0] & ~N & V) | (~S[3] & S[1] & N & ~V)
                | (S[1] & ~S[0] & N & ~V) | (S[3] & ~S[1] & S[0] & ~N & V);

 assign Sf[1] = (S[2] & S[1] & ~S[0]) | (~S[3] & ~S[2] & S[0] & ~L & A) |
                (~S[3] & ~S[2] & S[0] & L & ~A) | (S[3] & ~S[2] & S[0] & N & ~V) |
                (~S[3] & S[1] & S[0]) | (S[3] & ~S[2] & S[1] & V) | (~S[2] & S[1] & N & V) |
                (~S[2] & S[1] & ~N & ~V) | (S[3] & ~S[2] & ~S[1] & ~S[0] & ~L & A) ;

 assign Sf[0] = (~S[3] & S[2] & S[0]) | (S[2] & ~S[1] & S[0]) | (~S[3] & ~S[2] & S[1] & ~N & V) |
                (S[3] & ~S[2] & S[1] & N & ~V) | (S[3] & ~S[2] & ~S[1] & ~S[0] & L & ~A) |
                | (~S[3] & ~S[1] & S[0] & ~L) | (~S[3] & ~S[1] & S[0] & A) | (S[3] & ~S[2] & S[0] & N) |
                (~S[2] & S[1] & S[0] & ~N) | (~S[2] & S[1] & S[0] & V) | (S[3] & ~S[2] & S[0] & ~V) |
                (~S[3] & ~S[2] & ~S[1] & ~S[0] & C & ~T);
//ASIGNACION DE LAS SALIDAS DEL MODULO
  assign SA[3] = S[2] | (S[3] & S[1] & S[0]);

  assign SA[2] = (~S[3] & S[2] & S[0]) | (S[3] & S[2] & ~S[0]);

  assign SA[1] = (S[2] & S[1]) | (S[3] & S[2] & S[0]) | (~S[3] & S[1] & S[0]) | (S[3] & S[1] & ~S[0]);

  assign SA[0] = S[3];

endmodule
