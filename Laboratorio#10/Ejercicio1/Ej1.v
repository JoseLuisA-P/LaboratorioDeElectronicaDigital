//Jose luis Alvarez Pineda
//19392
//Seccion 21
//Ejercicio 1: Laboratorio #10

//Modulo PC
module PromCounter(
  input wire reset, clk, LOAD, ENABLE,
  input wire [11:0] Bload,
  output reg [11:0] Y
  );

  always @ ( posedge clk, posedge LOAD, posedge reset) begin

  if(reset == 1) begin
  Y <= 12'b0;
  end

  else if(LOAD == 1) begin
  Y <= Bload;
  end

  else if(ENABLE == 1)begin
  Y <= Y + 12'd1;
  end

  end
endmodule

//Modulo PROM
module PromROM (
  input wire [11:0] direccion, //entrada de direccion, para seleccionar localidad
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

//Modulo Fetch
module FETCH(
  input wire clk,reset,enable,
  input wire [7:0] D,
  output reg [7:0] Y);

  always @ (posedge clk, posedge reset) begin
    if (reset == 1) Y <= 0;
    else if(enable == 1) Y <= D;
    else Y <= Y;
  end

endmodule

//union de modulos
module EJ1(
  input wire clk,reset,ENfetch,ENpc,LOADpc,
  input wire [11:0]DataLOADpc,
  output wire [7:0] program_byte,
  output wire [3:0] instr,oprnd);

wire[11:0] PC;
wire[7:0] RomFbus;

//modulo PC
PromCounter PROG(.reset(reset),.clk(clk),.LOAD(LOADpc),.ENABLE(ENpc),.Bload(DataLOADpc),.Y(PC));
//modulo ProgramRom
PromROM PRM(.direccion(PC),.salida(RomFbus));
//modulo Fetch
FETCH ft(.reset(reset),.clk(clk),.enable(ENfetch),.D(RomFbus),.Y({instr,oprnd}));

assign program_byte = RomFbus;

endmodule
