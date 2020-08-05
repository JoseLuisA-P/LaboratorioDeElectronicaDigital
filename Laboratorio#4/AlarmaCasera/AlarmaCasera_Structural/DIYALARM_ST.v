module DIYALARM_ST(
  input wire S,W,K,
  output wire A);

assign A = S & (~W | M);

endmodule
