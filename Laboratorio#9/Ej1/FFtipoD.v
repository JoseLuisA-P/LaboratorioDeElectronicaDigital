//Jose Luis Alvarez Pineda
//19392
//Seccion 21
//Laboratorio #9: Ejercicio de FF tipo D 1 bit, 2 bits y 4 bits.

module Dflop(
  input wire clk,reset,enable,D,
  output reg Y);

  always @ (posedge clk, posedge reset) begin
    if (reset == 1) Y <= 0;
    else if(enable == 1) Y <= D;
    else Y <= Y;
  end

endmodule

module Dflop2b(
  input wire clk,reset,enable,
  input wire[1:0] D,
  output wire[1:0] Y);

  Dflop bit1(clk,reset,enable,D[0],Y[0]);
  Dflop bit2(clk,reset,enable,D[1],Y[1]);

endmodule

module Dflop4b(
  input wire clk, reset,enable,
  input wire [3:0] D,
  output wire [3:0] Y);

  Dflop bit1(clk,reset,enable,D[0],Y[0]);
  Dflop bit2(clk,reset,enable,D[1],Y[1]);
  Dflop bit3(clk,reset,enable,D[2],Y[2]);
  Dflop bit4(clk,reset,enable,D[3],Y[3]);

endmodule
