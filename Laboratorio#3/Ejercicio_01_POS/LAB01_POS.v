module LAB01_POS();

// POS de la tabla01 del laboratorio 3

  reg A, B, C;
  wire NA, NB, NC, w1, w2, w3, w4, out;


  not s1(NA,A); //(salida, entradas)
  not s2(NB,B);
  not s3(NC,C);
  or sum1(w1,NA,NB,C);
  or sum2(w2,A,B,NC);
  or sum3(w3,A,NB,NC);
  or sum4(w4,NA,NB,C);
  and mult1(out,w1,w2,w3,w4);

  initial begin
    $display("A B C| Y");
    $display("-------");

    $monitor("%b %b %b| %b", A, B, C, out);
    A = 0; B = 0; C=0;
    #1 A = 0; B = 0; C=1;
    #1 A = 0; B = 1; C=0;
    #1 A = 0; B = 1; C=1;
    #1 A = 1; B = 0; C=0;
    #1 A = 1; B = 0; C=1;
    #1 A = 1; B = 1; C=0;
    #1 A = 1; B = 1; C=1;
    #5 $finish;
  end

  initial
    begin
      $dumpfile("LAB01_POS_tb.vcd");
      $dumpvars(0, LAB01_POS);
    end

endmodule
