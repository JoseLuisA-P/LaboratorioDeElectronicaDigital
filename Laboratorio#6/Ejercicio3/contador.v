///////////////////////////////////////////////////////////////////////////////
///Jose Luis Alvarez Pineda
///19392
///Electronica digital
///Laboratorio #06, ejercicio #3 implementado en verilog
///////////////////////////////////////////////////////////////////////////////
//se reutilizo el flip flop del ejercicio 5
module Dflop(input logic clk,
  input logic areset,
  input logic[2:0] D,
  output reg[2:0] Y);
//areset es el reset asincrono en el flip flop, no es necesario el clock para cambiar el
//estado
  always @ (posedge clk, posedge areset) begin
      //if para evitar que otro valor pase cuando se active el reset
      if(areset)
      Y <= 3'b000;
      else
      Y <= D;
  end

endmodule

////////////////////////////////////////////////////////////////////////////////
module EJ3(input logic clk,
  input logic reset,
  input logic A,
  output reg[2:0] sal);

  wire[2:0] S;
  Dflop FD1 (clk, reset, S, sal);
  assign S[2] = (sal[2] & sal[0]) | (sal[1] & ~ sal[0] & A) | (~sal[1] & ~sal[0] & ~A);
  assign S[1] = (sal[1] & ~sal[0]) | (~sal[2] & sal[0] & A) | (sal[2] & sal[0] & ~A);
  assign S[0] = (sal[2] & sal[1] & A) | (~sal[2] & ~sal[1] & A) | (~sal[2] & sal[1] & ~A)
                  | (sal[2] & ~sal[1] & ~A);
                  
endmodule
