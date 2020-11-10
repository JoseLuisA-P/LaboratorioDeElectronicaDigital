//Jose Luis Alvarez Pineda
//19392
//seccion 21
//laboratorio #9: buffer tri estado (reutilizado para el proyecto del microprocesador)

module tribuff(
  input wire enable,
  input wire [3:0] D,
  output wire [3:0] Y);

  assign Y = enable? D:'bz;

endmodule
