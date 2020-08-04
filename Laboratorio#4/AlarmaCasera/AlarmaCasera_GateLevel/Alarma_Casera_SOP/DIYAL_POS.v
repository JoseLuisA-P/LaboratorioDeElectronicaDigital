module DIYAL_POS();

reg S, W, M;
wire NS, NW, NM, out, lin1, lin2, lin3;

not neg1(NS, S);
not neg2(NW, W);
not neg3(NM, M);
and mult1(lin1, S, NW, NM);
and mult2(lin2, S, NW, M);
and mult3(lin3, S, W, M);
or sum1(out, lin1, lin2, lin3);

initial begin
  $display("S  ")
  $monitor()
end

endmodule
