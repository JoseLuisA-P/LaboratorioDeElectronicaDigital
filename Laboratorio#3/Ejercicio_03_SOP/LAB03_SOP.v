module LAB03_SOP();

// SOP de la tabla03 del laboratorio 3

  reg A, B, C, D;
  wire NA, NB, NC, ND, w1, w2, w3, w4, w5, w6, w7, out;


  not s1(NA,A); //(salida, entradas)
  not s2(NB,B);
  not s3(NC,C);
  not s4(ND,D);
  and mult1(w1,NA,NB,NC,ND);
  and mult2(w2,NA,NB,NC,D);
  and mult3(w3,NA,NB,C,ND);
  and mult4(w4,NA,NB,C,D);
  and mult5(w5,A,NB,NC,ND);
  and mult6(w6,A,NB,C,ND);
  and mult7(w7,A,B,C,ND);
  or sum1(out,w1,w2,w3,w4,w5,w6,w7);

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
      $dumpfile("LAB03_SOP_tb.vcd");
      $dumpvars(0, LAB03_SOP);
    end

endmodule
