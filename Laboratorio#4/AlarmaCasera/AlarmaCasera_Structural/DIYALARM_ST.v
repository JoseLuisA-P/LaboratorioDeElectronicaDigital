module DIYALARM_ST(
  input wire S,W,M,
  output wire A);
/*
Se agregaron primero las entradas.
*/
assign A = S & (~W | M);

endmodule
