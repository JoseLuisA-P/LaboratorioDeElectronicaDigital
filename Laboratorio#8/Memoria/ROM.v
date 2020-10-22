module ROM (
  input wire [0:12] direccion, //entrada de direccion, para seleccionar localidad
  output wire [7:0] salida //salida para dar los datos de localidad
  );
  
//registro de 4K X 8
reg [7:0] memoria[0:12];

//para leer la memoria en binario ante cada fila
initial begin
  $readmemb("memROM.list.txt", memoria);
end

//asignar a la salida el valor de la memoria en esa localidad
assign salida = memoria[direccion];

endmodule
