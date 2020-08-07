///////////////////////////////////////////////////////////////////////////////
///Jose Luis Alvarez Pineda
///19392
///Ingenieria mecatronica
///Electronica digital
///////////////////////////////////////////////////////////////////////////////
module AlamK();
/*
Karnaugh de la alarma de casa casera.
*/
  reg A, B, C;
  wire NB, NC, out, lin1, lin2;

  not neg2(NB,B);
  not neg3(NC,C);
  and mult1(lin1,A,NB);
  and mult2(lin2,A,C);
  or sumfin(out,lin1,lin2);

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
  $dumpfile("AlamK_tb.vcd");
  $dumpvars(0,AlamK);
  end

endmodule
