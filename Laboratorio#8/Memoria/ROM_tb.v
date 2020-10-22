module testbench();
reg [11:0]address; //para seleccionar la localidad
wire [7:0] sal; //salida de la direccion

//crear la memoria
ROM memoria (address,sal);

//para sltar en las direcciones y leerlas en orden
initial begin
address = 0;
forever #1 address = address + 1;
end

//terminar el bucle
initial begin
#100 $finish;
end

//guardar los archivos y desplegar en GTKWAVE
initial begin
$dumpfile("ROM_tb.vcd");
$dumpvars(0, testbench);
end

endmodule
