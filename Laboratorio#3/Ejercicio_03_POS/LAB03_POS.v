module LAB03_POS();

// POS de la tabla03 del laboratorio 3

  reg A, B, C, D;
  wire NA, NB, NC, ND, w1, w2, w3, w4, w5, w6, w7, w8, w9, out;


  not s1(NA,A); //(salida, entradas)
  not s2(NB,B);
  not s3(NC,C);
  not s4(ND,D);
  or sum1(w1,A,NB,C,D);
  or sum2(w2,A,NB,C,ND);
  or sum3(w3,A,NB,NC,D);
  or sum4(w4,A,NB,NC,ND);
  or sum5(w5,NA,B,C,ND);
  or sum6(w6,NA,B,NC,ND);
  or sum7(w7,NA,NB,C,D);
  or sum8(w8,NA,NB,C,ND);
  or sum9(w9,NA,NB,NC,ND);
  and mult1(out,w1,w2,w3,w4,w5,w6,w7,w8,w9);

  initial begin
    $display("A B C D| Y");
    $display("----------");

    $monitor("%b %b %b %b| %b", A, B, C, D, out);
    A = 0; B = 0; C=0; D=0;
    #1 A = 0; B = 0; C = 0; D = 0;
    #1 A = 0; B = 0; C = 0; D = 1;
    #1 A = 0; B = 0; C = 1; D = 0;
    #1 A = 0; B = 0; C = 1; D = 1;
    #1 A = 0; B = 1; C = 0; D = 0;
    #1 A = 0; B = 1; C = 0; D = 1;
    #1 A = 0; B = 1; C = 1; D = 0;
    #1 A = 0; B = 1; C = 1; D = 1;
    #1 A = 1; B = 0; C = 0; D = 0;
    #1 A = 1; B = 0; C = 0; D = 1;
    #1 A = 1; B = 0; C = 1; D = 0;
    #1 A = 1; B = 0; C = 1; D = 1;
    #1 A = 1; B = 1; C = 0; D = 0;
    #1 A = 1; B = 1; C = 0; D = 1;
    #1 A = 1; B = 1; C = 1; D = 0;
    #1 A = 1; B = 1; C = 1; D = 1;
    #1 $finish;
  end

  initial
    begin
      $dumpfile("LAB03_POS_tb.vcd");
      $dumpvars(0, LAB03_POS);
    end

endmodule
