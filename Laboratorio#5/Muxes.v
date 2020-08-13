///////////////////////////////////////////////////////////////////////////////
//Jose Luis Alvarez Pineda
//19392
//Electronica digital
// Muxes para el laboratorio 5
///////////////////////////////////////////////////////////////////////////////
//MUXES de uso general
//MUX 2:1 de uso general para la practica
module Mux2(
  output wire Y,
  input wire D0,D1,S);

  assign  Y = S ? D1:D0; //Si S=1 Y toma el valor de D1 Y si S=0 Y toma el valor de D0

endmodule
//MUX 4:1 de uso general para la practica
module Mux4(
  output wire Y,
  input wire D0,D1,D2,D3,S0,S1);

  logic lin0, lin1; //variables locales

  Mux2 selec0 (lin0, D0, D1, S0);
  Mux2 selec1 (lin1, D2, D3, S0);
  Mux2 selec2 (Y, lin0, lin1, S1);

endmodule

////////////////////////////////////////////////////////////////////////////////
//MUXES para el uso en las tablas
//MUX 2:1 exclusivo a la tabla01 del lab5
module MUX2T1(
  output wire Y,
  input wire A,B,C);

  logic y1,y2; //variables locales

  assign y1 = B ^ C; //xor
  assign y2 = B ~^ C;//xnor

  Mux2 select0 (Y, y1, y2, A);

endmodule
