//Jose Luis Alvarez Pineda
//19392
//Seccion 21
//Laboratorio #09, construccion de un FF tipo T utilizando un FF tipo D

module Dflop(
  input wire clk,reset,enable,D,
  output reg Y);

  always @ (posedge clk, posedge reset) begin
    if (reset == 1) Y <= 0;
    else if(enable == 1) Y <= D;
    else Y <= Y;
  end

endmodule

module TFLOP(
  input wire clk,reset,enable,
  output wire Y);

wire Tval;

Dflop Dff(clk,reset,enable,Tval,Y);
assign Tval = enable ^ Y;

endmodule
