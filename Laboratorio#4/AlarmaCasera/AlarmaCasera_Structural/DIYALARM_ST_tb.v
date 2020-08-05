module testbench();
/*
TestBench para la alarma casera
*/
  reg S,M,W;
  wire out;

  DIYALARM_ST alm1(S,W,M,out);

  initial begin
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
    #1 $finish;
  end
  // Parte para visualizar el GTKwave

  initial begin

  $dumpfile("DIYALARM_ST_tb.vcd");
  $dumpvars(0, testbench);

  end

endmodule
