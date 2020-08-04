module LAB_01_SOP();

// SOP de la tabla01 del laboratorio 3

  reg A, B, C;
  wire NA, NB, NC, w1, w2, w3, w4, w5, out;


  not s1(NA,A); //(salida, entradas)
  not s2(NB,B);
  not s3(NC,C);
  and mult1(w1,NA,NB,NC);
  and mult2(w2,NA,B,NC);
  and mult3(w3,A,NB,NC);
  and mult4(w4,A,NB,C);
  and mult5(w5,A,B,C);
  or sum1(out,w1,w2,w3,w4,w5);

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
      $dumpfile("LAB_01_SOP_tb.vcd");
      $dumpvars(0, LAB_01_SOP);
    end

endmodule
