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

  wire lin0, lin1; //variables locales

  Mux2 selec0 (lin0, D0, D1, S0);
  Mux2 selec1 (lin1, D2, D3, S0);
  Mux2 selec2 (Y, lin0, lin1, S1);

endmodule

//MUX 8:1 de uso general para la practica
module Mux8(
  output wire Y,
  input wire D0,D1,D2,D3,D4,D5,D6,D7,S0,S1,S2);

  wire lin0, lin1; //variables locales

  Mux4 selec0(lin0,D0,D1,D2,D3,S0,S1);
  Mux4 selec1(lin1,D4,D5,D6,D7,S0,S1);
  Mux2 selec2(Y,lin0,lin1,S2);

endmodule

////////////////////////////////////////////////////////////////////////////////
//MUXES para el uso en las tablas

//MUX 2:1 exclusivo a la tabla01 del lab5
module MUX2T1(
  output wire Y,
  input wire A,B,C);

  wire y1,y2; //variables locales

  assign y1 = B ^ C; //xor
  assign y2 = B ~^ C;//xnor

  Mux2 select0 (Y, y1, y2, A);

endmodule

//MUX 4:1 exclusivo de la tabla01 del lab5
module MUX4T1(
  output wire Y,
  input wire A,B,C);

  Mux4 selec4t1(Y, C, ~C, ~C, C, B, A);

endmodule

//MUX 8:1 exclusivo de la tabla01 del lab5
module MUX8T1(
  output wire Y,
  input wire A,B,C);

  wire D0,D1,D2,D3,D4,D5,D6,D7;
  assign D0 = 0;
  assign D1 = 1;
  assign D2 = 1;
  assign D3 = 0;
  assign D4 = 1;
  assign D5 = 0;
  assign D6 = 0;
  assign D7 = 1;

  Mux8 select8t1(Y,D0,D1,D2,D3,D4,D5,D6,D7,C,B,A);

endmodule

//MUX 2:1 exclusivo de la tabla 02 del lab5
module MUX2T2(
  output wire Y,
  input wire A,B,C);

  wire y1,y2; //variables locales
  assign y1 = B ~| C;
  assign y2 = B ^ C;

  Mux2 select2t2 (Y,y1,y2,A);

endmodule
