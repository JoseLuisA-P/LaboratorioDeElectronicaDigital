module testbench();
/*
TestBench para la alarma casera
*/
  reg S,M,W;
  wire out, outPOS, outSOP;
  //
  DIYALARM_ST alm1(S,W,M,out);
  //
  DIYALARM_POS alm2(S,W,M,outPOS);
  //
  DIYALARM_SOP alm3(S,W,M,outSOP);

  //Bloque initial del sistema con karnaugh
  initial begin
    $display("\n\n");
    $display("TABLA DE LA ECUACION IMPLEMENTADA CON KARNAUGH");
    $display("S| W| M| A|");
    $display("-----------");
    $monitor("%b| %b| %b| %b|", S, W, M, out);
    S=0; W=0; M=0;
    #1 S=0; W=0; M=1;
    #1 S=0; W=1; M=0;
    #1 S=0; W=1; M=1;
    #1 S=1; W=0; M=0;
    #1 S=1; W=0; M=1;
    #1 S=1; W=1; M=0;
    #1 S=1; W=1; M=1;
  end

  //Bloque initial del sistema con POS
  initial begin
  #10
    $display("\n\n");
    $display("TABLA DE LA ECUACION IMPLEMENTADA EN POS");
    $display("S| W| M| A|");
    $display("-----------");
    $monitor("%b| %b| %b| %b|", S, W, M, outPOS);
    S=0; W=0; M=0;
    #1 S=0; W=0; M=1;
    #1 S=0; W=1; M=0;
    #1 S=0; W=1; M=1;
    #1 S=1; W=0; M=0;
    #1 S=1; W=0; M=1;
    #1 S=1; W=1; M=0;
    #1 S=1; W=1; M=1;
  end

  //Bloque initial del sistema con SOP
  initial begin
  #20
    $display("\n\n");
    $display("TABLA DE LA ECUACION IMPLEMENTADA EN SOP");
    $display("S| W| M| A|");
    $display("-----------");
    $monitor("%b| %b| %b| %b|", S, W, M, outSOP);
    S=0; W=0; M=0;
    #1 S=0; W=0; M=1;
    #1 S=0; W=1; M=0;
    #1 S=0; W=1; M=1;
    #1 S=1; W=0; M=0;
    #1 S=1; W=0; M=1;
    #1 S=1; W=1; M=0;
    #1 S=1; W=1; M=1;
  end

  initial begin
    #30 $finish;
  end
  // Parte para visualizar el GTKwave
  initial begin
  $dumpfile("DIYALARM_ST_tb.vcd");
  $dumpvars(0, testbench);

  end

endmodule
