///////////////////////////////////////////////////////////////////////////////
///Jose Luis Alvarez Pineda
///19392
///Electronica digital
///Laboratorio #06, diseño de flip-flop tipo D con reset asincrono y set sincrono
///////////////////////////////////////////////////////////////////////////////
module Dflop(input logic clk,
  input logic areset, set,
  input logic[3:0] D,
  output reg[3:0] Y);
//areset es el reset asincrono en el flip flop, no es necesario el clock para cambiar el
//estado
  always @ (posedge clk, posedge areset) begin
      //if para evitar que otro valor pase cuando se active el reset
      if(areset)
      Y <= 4'b0000;
      else begin
        if(set == 1)
        Y <= 4'b1111;
        else
        Y <= D;
      end
  end

endmodule
