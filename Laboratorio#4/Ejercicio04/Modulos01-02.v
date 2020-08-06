module T01(
  output wire Y,
  input wire A,B,C);
//Modulo de la tabla 01, laboratorio 04
    assign Y = (~A & ~C) | (~B & ~C) | (A & C) ;

endmodule
