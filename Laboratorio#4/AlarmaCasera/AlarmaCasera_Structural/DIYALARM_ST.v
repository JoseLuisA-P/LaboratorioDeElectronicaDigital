////////////////////////////////////////////////////////////////////////////////
//Jose Luis Alvarez Pineda
//19392
//Ingenieria mecatronica
//electronica digital
////////////////////////////////////////////////////////////////////////////////
module DIYALARM_ST(
  input wire S,W,M,
  output wire A);
/*
Se agregaron primero las entradas.
*/
assign A = S & (~W | M);

endmodule
////////////////////////////////////////////////////////////////////////////////
module DIYALARM_POS(
  input wire A,B,C,
  output wire Y);
//Modulo de la alarma POS
assign Y = (A|B|C) & (A|B|~C) & (A|~B|C) & (A|~B|~C) & (~A|~B|C);

endmodule
////////////////////////////////////////////////////////////////////////////////
module DIYALARM_SOP(
  input wire A,B,C,
  output wire Y);

  assign Y = (A & ~B & ~C) | (A & ~B & C) | (A & B & C);

endmodule
