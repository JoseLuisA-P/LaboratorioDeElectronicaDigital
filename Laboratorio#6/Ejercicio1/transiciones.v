///////////////////////////////////////////////////////////////////////////////
///Jose Luis Alvarez Pineda
///19392
///Electronica digital
///Laboratorio #06, ejercicio #1 implementado en verilog
///////////////////////////////////////////////////////////////////////////////
//se reutilizo el flip flop del ejercicio 5
module Dflop(input logic clk,
  input logic areset,
  input logic[1:0] D,
  output reg[1:0] Y);
//areset es el reset asincrono en el flip flop, no es necesario el clock para cambiar el
//estado
  always @ (posedge clk, posedge areset) begin
      //if para evitar que otro valor pase cuando se active el reset
      if(areset)
      Y <= 2'b00;
      else
      Y <= D;
  end

endmodule

///////////////////////////////////////////////////////////////////////////////
module EJ1(input logic clk,
  input logic reset,A,B,
  output wire Y,
  output wire[1:0] SAL);

  wire[1:0] S;

  Dflop DF1 (clk, reset, S, SAL);

  assign S[1] = (SAL[0] & B) | (SAL[1] & A & B);
  assign S[0] = (~SAL[1] & A & ~SAL[0]);
  assign Y = (SAL[1] & A & B);

endmodule
