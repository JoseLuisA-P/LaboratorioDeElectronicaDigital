module testbench();
reg enable,clk,reset;
wire Y;

TFLOP FFT (clk,reset,enable,Y);

initial begin
clk = 0;
forever #1 clk = ~clk;
end

initial begin
reset = 1; enable = 0;
#1 reset = 0;
#5 enable = 1;
#10 enable = 0;
#5 enable = 1;
#2 reset = 1; enable = 0;
#1 reset = 0;
end

initial begin
#100 $finish;
end

initial begin
$dumpfile("Tflop_tb.vcd");
$dumpvars(0, testbench);
end

endmodule
