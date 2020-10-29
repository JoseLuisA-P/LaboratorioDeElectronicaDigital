module testbench();
reg[6:0] direccion;
wire[12:0] datos;

ROMcase ROM(direccion,datos);

initial begin
$display("direccion      |datos       ");
$monitor("%7b            |%13b        ",direccion,datos);
direccion = 7'b0000000;
#2 direccion = 7'b0000101;
#2 direccion = 7'b0000001;
#2 direccion = 7'b0001101;
#2 direccion = 7'b0001001;
#2 direccion = 7'b0010001;
#2 direccion = 7'b0011001;
#2 direccion = 7'b0100001;
#2 direccion = 7'b0101001;
#2 direccion = 7'b0110001;
#2 direccion = 7'b0111001;
#2 direccion = 7'b1000011;
#2 direccion = 7'b1000001;
#2 direccion = 7'b1001011;
#2 direccion = 7'b1001001;
#2 direccion = 7'b1010001;
#2 direccion = 7'b1011001;
#2 direccion = 7'b1100001;
#2 direccion = 7'b1101001;
#2 direccion = 7'b1110001;
#2 direccion = 7'b1111001;
//prueba de bxxxxxx0
#2 direccion = 7'b0101010;
#2 direccion = 7'bzzzzzz0;
//prueba de b0110xx
#2 direccion = 7'b0110zz1;
//prueba de b1100xx1
#2 direccion = 7'b1100zz1;
//prueba de b1111xx1
#2 direccion = 7'b1111zz1;
//prueba de b00001z1
#2 direccion = 7'b00001z1;
//pru3ba de b0111xx1
#2 direccion = 7'b0111zz1;
end

initial begin
#100 $finish;
end

initial begin
$dumpfile("ROM_case_tb.vcd");
$dumpvars(0, testbench);
end

endmodule
