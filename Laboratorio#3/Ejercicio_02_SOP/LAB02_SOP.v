module LAB02_SOP();

// SOP de la tabla02 del laboratorio 3

  reg A, B, C;
  wire NA, NB, NC, w1, w2, w3, out;


  not s1(NA,A); //(salida, entradas)
  not s2(NB,B);
  not s3(NC,C);
  and mult1(w1,NA,NB,C);
  and mult2(w2,A,B,NC);
  and mult3(w3,A,B,C);
  or sum1(out,w1,w2,w3);

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
      $dumpfile("LAB02_SOP_tb.vcd");
      $dumpvars(0, LAB02_SOP);
    end

endmodule
