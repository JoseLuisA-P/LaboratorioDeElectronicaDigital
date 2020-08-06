////////////////////////////////////////////////////////////////
module T01(
  output wire Y,
  input wire A,B,C);
//Modulo de la tabla 01, laboratorio 04
    assign Y = (~A & ~C) | (~B & ~C) | (A & C) ;

endmodule
////////////////////////////////////////////////////////////////
module T02(
  output wire Y,
  input wire A,B,C);
//modulo asociado a la tabla 01, laboratorio 04
    assign Y = ~B;

endmodule
////////////////////////////////////////////////////////////////
module T03(
  output wire Y,
  input wire A,B,C,D);

    assign Y = (~A & ~B & ~C & ~D) | (~A & ~B & C & D) |(~A & B & ~C & D) |
                (~A & B & C & ~D) | (A & B & ~C & ~D) | (A & B & C & D) |
                (A & ~B & ~C & D) | (A & ~B & C & ~D);

endmodule
////////////////////////////////////////////////////////////////
module T04(
  output wire Y,
  input wire A,B,C,D);

    assign Y = (B & D) | (A & B) | (~B & ~D) | (A & C);

endmodule
////////////////////////////////////////////////////////////////
module EJ021(
  output wire Y,
  input wire A,B,C,D);

  assign Y =  ;

endmodule
////////////////////////////////////////////////////////////////
