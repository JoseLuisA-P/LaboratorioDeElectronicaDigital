////////////////////////////////////////////////////////////////
//Jose Luis Alvarez Pineda
//Carne 19392
//Ingenieria mecatronica
//Electronica digital
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
//modulo asociado a la tabla 02, laboratorio 04
    assign Y = ~B;

endmodule
////////////////////////////////////////////////////////////////
module T03(
  output wire Y,
  input wire A,B,C,D);
//modulo asociado a la tabla 03, laboratorio 04
    assign Y = (~A & ~B & ~C & ~D) | (~A & ~B & C & D) |(~A & B & ~C & D) |
                (~A & B & C & ~D) | (A & B & ~C & ~D) | (A & B & C & D) |
                (A & ~B & ~C & D) | (A & ~B & C & ~D);

endmodule
////////////////////////////////////////////////////////////////
module T04(
  output wire Y,
  input wire A,B,C,D);
//modulo asociado a la tabla 04, laboratorio 04
    assign Y = (B & D) | (A & B) | (~B & ~D) | (A & C);

endmodule
////////////////////////////////////////////////////////////////


//MODULOS REALIZADOS CON GATELEVEL MODELLING
////////////////////////////////////////////////////////////////
module EJ021(
  output wire Y,
  input wire A,B,C,D);
//modulo asociado a el ejercicio 2 ecuacion 1, laboratorio 04
    not neg1(NA,A);
    not neg2(NB,B);
    not neg3(NC,C);
    not neg4(ND,D);
    and mult1(W1,NB,NC,ND);
    and mult2(W2,A,ND);
    and mult3(W3,A,NC);
    and mult4(W4,A,NB);
    or sumfinal(Y,W1,W2,W3,W4);

endmodule
////////////////////////////////////////////////////////////////
module EJ022(
  output wire Y,
  input wire A,B,C);
  //modulo asociado al ejercicio 2 ecuacion 2, laboratorio 04
    not neg1(NB,B);
    or sum1(Y,NB,C);

endmodule
////////////////////////////////////////////////////////////////
module EJ023(
  output wire Y,
  input wire A,B,C,D);
  //modulo asociado al ejercicio 2 ecuacion 3, laboratorio 04
  not neg1(NC,C);
  and mult1(W1,NC,D);
  and mult2(W2,A,D);
  or sumfinal(Y,W1,W2,B);

endmodule
////////////////////////////////////////////////////////////////
module EJ024(
  output wire Y,
  input wire A,B,C);
  //modulo asociaido al ejercicio 2 ecuacion 4, laboratorio 04
  not neg1(NA,A);
  not neg2(NC,C);
  and mult1(W1,NA,NC);
  or sumfinal(Y,W1,B);

endmodule
////////////////////////////////////////////////////////////////
