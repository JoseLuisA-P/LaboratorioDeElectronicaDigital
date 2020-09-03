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
  output wire[1:0] SAL);


endmodule
