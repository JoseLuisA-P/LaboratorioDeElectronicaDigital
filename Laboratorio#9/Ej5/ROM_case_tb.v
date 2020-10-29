module testbench();
reg[6:0] direccion;
wire[12:0] datos;

ROMcase ROM(direccion,datos);

initial begin
direccion = 7'b0000000;
#2 direccion = 7'b1101000;
#2 direccion = 7'b0000101;
#2 direccion = 7'b0000001;
end

initial begin
#100 $finish;
end

initial begin
$dumpfile("ROM_case_tb.vcd");
$dumpvars(0, testbench);
end

endmodule
