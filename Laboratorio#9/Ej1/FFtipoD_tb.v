module testbench();
reg D1,clk,reset,enable;
reg[1:0] D2;
reg[3:0] D4;
wire Y1;
wire[1:0] Y2;
wire[3:0] Y4;

Dflop FF1B(clk,reset,enable,D1,Y1);
Dflop2b FF2B(clk,reset,enable,D2,Y2);
Dflop4b FF4B(clk,reset,enable,D4,Y4);

initial begin
clk = 0;
  forever #1 clk = ~clk;
end

initial begin
//Prueba FF de 1 bit
#1 reset = 1; enable = 0; D1 = 0; D2 = 0; D4 = 0;
#1 reset = 0; D1 = 1;
#4 enable = 1;
#2 D1 = 0;

//Prueba FF de 2 bits
#1 reset = 1; enable = 0; D2 = 2'b11;
#1 reset = 0;
#2 enable = 1;
#4 D2 = 2'b10;
#4 D2 = 2'b01;
#2 enable = 0;
#2 D2 = 2'b00;
#2 D2 = 2'b11;

//prueba de FF de 4 bits
#1 reset = 1; enable = 0; D4 = 4'b0011;
#1 reset = 0;
#4 enable = 1;
#4 D4 = 4'b0110;
#4 D4 = 4'b1010;
#4 D4 = 4'b1111;
#4 D4 = 4'b1100;
#2 enable = 0;
#4 D4 = 4'b0110;
#4 D4 = 4'b1010;
#4 D4 = 4'b1111;

end

initial begin
#100 $finish;
end

initial begin
$dumpfile("FFtipoD_tb.vcd");
$dumpvars(0, testbench);
end

endmodule
