module DIYAL_POS();
/*
POS de la alarma de casa casera.
*/
reg S, W, M;
wire NS, NW, NM, out, lin1, lin2, lin3;

not neg1(NS, S);
not neg2(NW, W);
not neg3(NM, M);
and mult1(lin1, S, NW, NM);
and mult2(lin2, S, NW, M);
and mult3(lin3, S, W, M);
or sum1(out, lin1, lin2, lin3);

//Para probar la salida que tendran las compuertas
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

//utilizado para GTKwave
  initial begin
  $dumpfile("DIYAL_POS_tb.vcd");
  $dumpvars(0,DIYAL_POS);
  end

endmodule
