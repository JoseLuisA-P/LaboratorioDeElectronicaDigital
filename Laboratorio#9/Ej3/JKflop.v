//Jose Luis Alvarez Pineda
//19392
//Seccion 21
//Laboratorio #9 implementacion de un FF tipo JK con un FF tipo D

module Dflop(
  input wire clk,reset,enable,D,
  output reg Y);

  always @ (posedge clk, posedge reset) begin
    if (reset == 1) Y <= 0;
    else if(enable == 1) Y <= D;
    else Y <= Y;
  end

endmodule

module JKflop(
    input wire clk,reset,enable,J,K,
    output wire Y);

    wire D;

    Dflop FFD(clk,reset,enable,D,Y);

    assign D = (~K & Y) | (J & ~Y);

endmodule
