//JOse Luis Alvarez Pineda
//19392
//Seccion 21
//Laboratorio #09: ROM con CASE

module ROMcase(
  input wire [6:0] direccion,
  output wire [12:0] senal
  );

  reg[12:0] datos;

  always @ ( direccion )
    casez (direccion)
      7'b??????0: datos <= 13'b1000000001000;
      7'b00001?1: datos <= 13'b0100000001000;
      7'b00000?1: datos <= 13'b1000000001000;
      7'b00011?1: datos <= 13'b1000000001000;
      7'b00010?1: datos <= 13'b0100000001000;
      7'b0010??1: datos <= 13'b0001001000010;
      7'b0011??1: datos <= 13'b1001001100000;
      7'b0100??1: datos <= 13'b0011010000010;
      7'b0101??1: datos <= 13'b0011010000100;
      7'b0110??1: datos <= 13'b1011010100000;
      7'b0111??1: datos <= 13'b1000000111000;
      7'b1000?11: datos <= 13'b0100000001000;
      7'b1000?01: datos <= 13'b1000000001000;
      7'b1001?11: datos <= 13'b1000000001000;
      7'b1001?01: datos <= 13'b0100000001000;
      7'b1010??1: datos <= 13'b0011011000010;
      7'b1011??1: datos <= 13'b1011011100000;
      7'b1100??1: datos <= 13'b0100000001000;
      7'b1101??1: datos <= 13'b0000000001001;
      7'b1110??1: datos <= 13'b0011100000010;
      7'b1111??1: datos <= 13'b1011100100000;
    endcase

assign senal = datos;

endmodule
