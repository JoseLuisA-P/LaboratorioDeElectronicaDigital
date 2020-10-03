///////////////////////////////////////////////////////////////////////////////
///Jose Luis Alvarez Pineda
///19392
///Electronica digital
///Proyecto 1
///FSM´s en conjunto
///union de todas las FSM y adicion del timmer
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
///////////////////////////////////////////////////////////////////////////////
///
///TIMMERS
///////////////////////////////////////////////////////////////////////////////
module timmerA(
  input wire CLK,
  input wire RESET,
  input wire [1:0] M,
  output reg Y,
  output reg[2:0] count);

  reg[2:0] tiempo = 3'b000;
  reg permit = 1;

always @ ( posedge CLK, M[1], M[0], RESET) begin

if(RESET == 1)begin
  tiempo <= 3'b000;
  Y <= 0;
  permit <= 1;
end

  if(CLK == 1)begin


      if((M[1] == 1) & (permit == 1))begin
        tiempo <= tiempo + 3'b001;
        Y <= 0;
      end

      else if((M[0] == 1) & (permit == 1))begin
        tiempo <= tiempo + 3'b001;
        Y <= 0;
      end

      if (tiempo == 3'b101)begin
        Y <= 1;
        permit <= 0;
      end

      count <= tiempo;
  end
end

endmodule

module timmerB(
  input wire CLK,
  input wire RESET,
  input wire [1:0] M,
  output reg Y,
  output reg[2:0] count);

  reg[2:0] tiempo = 3'b000;
  reg permit = 1;

always @ ( posedge CLK, M[1], M[0], RESET) begin

if(RESET == 1)begin
  tiempo <= 3'b000;
  Y <= 0;
  permit <= 1;
end

  if(CLK == 1)begin

      if((M[1] == 1) & (permit == 1))begin
        tiempo <= tiempo + 3'b001;
        Y <= 0;
      end

      else if((M[0] == 1) & (permit == 1))begin
        tiempo <= tiempo + 3'b001;
        Y <= 0;
      end

      if (tiempo == 3'b110)begin
        Y <= 1;
        permit <= 0;
      end

      count <= tiempo;
  end
end

endmodule

module timmerC(
  input wire CLK,
  input wire RESET,
  input wire [1:0] M,
  output reg Y,
  output reg[2:0] count);

  reg[2:0] tiempo = 3'b000;
  reg permit = 1;

always @ ( posedge CLK, M[1], M[0], RESET) begin

if(RESET == 1)begin
  tiempo <= 3'b000;
  Y <= 0;
  permit <= 1;
end

  if(CLK == 1)begin

      if((M[1] == 1) & (permit == 1))begin
        tiempo <= tiempo + 3'b001;
        Y <= 0;
      end

      else if((M[0] == 1) & (permit == 1))begin
        tiempo <= tiempo + 3'b001;
        Y <= 0;
      end

      if (tiempo == 3'b011)begin
        Y <= 1;
        permit <= 0;
      end

      count <= tiempo;
  end
end

endmodule

///////////////////////////////////////////////////////////////////////////////
///
///MAQUINA DISPENSADORA
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
assign M1[1] = ~S[3] & ~S[2] & S[1] & ~S[0];

assign M1[0] = ~S[3] & ~S[2] & ~S[1] & S[0];

assign M2[1] = ~S[3] & S[2] & ~S[1] & S[0];

assign M2[0] = ~S[3] & S[2] & ~S[1] & ~S[0];

assign M3 = S[3] & ~S[2] & ~S[1] & ~S[0];

assign Li = (~S[3] & S[2] & S[1] & S[0]) | (S[3] & ~S[2] & ~S[1] & S[0]);

assign IND[2] = (~S[3] & S[2] & S[1]) | (S[3] & ~S[2] & ~S[1]) | (~S[3] & S[2] & S[0]) | (~S[3] & S[1] & S[0]);

assign IND[1] = (~S[3] & S[1]) | (~S[3] & S[2] & ~S[0]) | (S[3] & ~S[2] & ~S[1] & S[0]);

assign IND[0] = (S[3] & ~S[2] & ~S[1]) | (~S[3] & S[2] & ~S[0]) | (~S[3] & ~S[2] & S[0]) | (~S[3] & S[1] & S[0]);

endmodule
///////////////////////////////////////////////////////////////////////////////
///
///MAQUINA SELECTORA
///////////////////////////////////////////////////////////////////////////////
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
