module testbench();
reg clk,reset,enable,J,K;
wire Y;

JKflop JKFF(clk,reset,enable,J,K,Y);

initial begin
clk = 0;
forever #1 clk = ~clk;
end

initial begin
reset = 1; J = 0; K = 0; enable = 0;
#1 reset = 0; enable = 1;
#3 J = 1; K = 0;
#6 J = 0; K = 1;
#6 J = 1; K = 1;
#6 J = 0; K = 0;
#6 enable = 0;
#2 J = 1; K = 0;
#2 J = 1; K = 1;
#6 reset = 1;
#1 reset = 0;
end

initial begin
#100 $finish;
end

initial begin
$dumpfile("JKflop_tb.vcd");
$dumpvars(0, testbench);
end

endmodule
