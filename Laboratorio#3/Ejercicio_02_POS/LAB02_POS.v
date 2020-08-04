module LAB02_POS();

// SOP de la tabla02 del laboratorio 3

  reg A, B, C;
  wire NA, NB, NC, w1, w2, w3, w4, w5, out;


  not s1(NA,A); //(salida, entradas)
  not s2(NB,B);
  not s3(NC,C);
  or sum1(w1,A,B,C);
  or sum2(w2,A,NB,C);
  or sum3(w3,A,NB,NC);
  or sum4(w4,NA,B,C);
  or sum5(w5,NA,B,NC);
  and mult1(out,w1,w2,w3,w4,w5);

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
      $dumpfile("LAB02_POS_tb.vcd");
      $dumpvars(0, LAB02_POS);
    end

endmodule
