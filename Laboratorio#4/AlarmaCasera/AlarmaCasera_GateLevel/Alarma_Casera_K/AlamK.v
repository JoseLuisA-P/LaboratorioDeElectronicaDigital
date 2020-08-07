///////////////////////////////////////////////////////////////////////////////
///Jose Luis Alvarez Pineda
///19392
///Ingenieria mecatronica
///Electronica digital
///////////////////////////////////////////////////////////////////////////////
module AlamK();
/*
POS de la alarma de casa casera.
*/
  reg A, B, C;
  wire NA, NB, NC, out, lin1, lin2, lin3, lin4, lin5;

  not neg1(NA,A);
  not neg2(NB,B);
  not neg3(NC,C);
  or sum1(lin1,A,B,C);
  or sum2(lin2,A,B,NC);
  or sum3(lin3,A,NB,C);
  or sum4(lin4,A,NB,NC);
  or sum5(lin5,NA,NB,C);
  and mult1(out,lin1,lin2,lin3,lin4,lin5);

//Para probar la salida que tendran las compuertas
  initial begin
    $display("A| B| C| A|");
    $display("-----------");
    $monitor("%b| %b| %b| %b|", A, B, C, out);
    A=0; B=0; C=0;
    #1 A=0; B=0; C=1;
    #1 A=0; B=1; C=0;
    #1 A=0; B=1; C=1;
    #1 A=1; B=0; C=0;
    #1 A=1; B=0; C=1;
    #1 A=1; B=1; C=0;
    #1 A=1; B=1; C=1;
    #1 $finish;
  end

//utilizado para GTKwave
  initial begin
  $dumpfile("Alamk_tb.vcd");
  $dumpvars(0,AlamK);
  end

endmodule
