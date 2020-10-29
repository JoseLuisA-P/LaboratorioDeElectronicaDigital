module testbench();
reg [3:0] D;
reg enable;
wire[3:0] Y;

tribuff Tris(enable,D,Y);

initial begin
enable = 0;
forever #2 enable = ~enable;
end

initial begin
D = 0;
forever #1 D = D + 1;
end


initial begin
#100 $finish;
end

initial begin
$dumpfile("Tribuf_tb.vcd");
$dumpvars(0, testbench);
end


endmodule
