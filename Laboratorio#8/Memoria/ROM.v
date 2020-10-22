module ROM (
  input wire [11:0] direccion, //entrada de direccion, para seleccionar localidad
  output wire [7:0] salida //salida para dar los datos de localidad
  );

//registro de 4K X 8
reg [7:0] memoria[11:0];

//para leer la memoria en binario ante cada fila
initial begin
  $readmemb("memROM.list.txt", memoria);
end

//asignar a la salida el valor de la memoria en esa localidad
assign salida = memoria[direccion];

endmodule
