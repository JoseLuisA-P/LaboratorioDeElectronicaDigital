module testbench();
reg clk, reset, ENfetch, ENpc,LOADpc;
reg [11:0] dataloadpc;
wire [7:0] program_byte;
wire [3:0] instr, oprnd;

//instancia del modulo de la interconexion
EJ1 mod(clk,reset,ENfetch,ENpc,LOADpc,dataloadpc,program_byte,instr,oprnd);

initial begin
clk = 0;
forever #2 clk = ~clk;
end

initial begin
reset = 1; ENfetch = 0; ENpc = 0; LOADpc = 0; dataloadpc = 12'd2;
#1 reset = 0;
#6 ENpc = 1;
#10 ENfetch = 1;

#20 LOADpc = 1;
#1 LOADpc = 0;

#20 reset = 1; ENpc = 0; ENfetch = 0;
#1 reset = 0;

end

initial begin
  #100 $finish;
end

initial begin
$dumpfile("Ej1_tb.vcd");
$dumpvars(0, testbench);
end


endmodule
