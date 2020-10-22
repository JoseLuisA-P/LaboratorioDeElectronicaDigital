module ROM (
  input wire [0:4095] direccion, //entrada de direccion, para seleccionar localidad
  output wire [7:0] salida //salida para dar los datos de localidad
  );

//registro de 4K X 8 (12 bits X 8 bits)
reg [7:0] memoria[0:4095];

//para leer la memoria en binario ante cada fila
initial begin
  $readmemb("MemROM.txt", memoria);
end

//asignar a la salida el valor de la memoria en esa localidad
assign salida = memoria[direccion];

endmodule
