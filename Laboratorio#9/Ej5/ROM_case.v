//JOse Luis Alvarez Pineda
//19392
//Seccion 21
//Laboratorio #09: ROM con CASE

module ROMcase(
  input wire [6:0] direccion,
  output reg [12:0] datos);

  always @ ( direccion ) begin
    casex (direccion)
      7'bxxxxxx0: datos <= 13'b1000000001000;
      7'b00001x1: datos <= 13'b0100000001000;
      7'b00000x1: datos <= 13'b1000000001000;
      7'b00011x1: datos <= 13'b1000000001000;
    endcase
  end

endmodule
