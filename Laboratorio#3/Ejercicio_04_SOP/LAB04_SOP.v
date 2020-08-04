module LAB04_SOP();

// SOP de la tabla04 del laboratorio 3

  reg A, B, C, D;
  wire NA, NB, NC, ND, w1, w2, w3, w4, w5, w6, w7, out;


  not s1(NA,A); //(salida, entradas)
  not s2(NB,B);
  not s3(NC,C);
  not s4(ND,D);
  and mult1(w1,NA,NB,NC,ND);
  and mult2(w2,NA,NB,C,ND);
  and mult3(w3,NA,NB,C,D);
  and mult4(w4,NA,B,C,ND);
  and mult5(w5,NA,B,C,D);
  and mult6(w6,A,NB,NC,ND);
  and mult7(w7,A,NB,C,ND);
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
      $dumpfile("LAB04_SOP_tb.vcd");
      $dumpvars(0, LAB04_SOP);
    end

endmodule
