//Jose Luis Alvarez Pineda
//19392
//Seccion 21
//Proyecto final, presentacion procesador

module uP(
  input wire clock,reset,
  input wire [3:0] pushbuttons,
  output wire c_flag,z_flag,
  output wire [3:0] instr,oprnd,data_bus,FF_out,accu,
  output wire [7:0] program_byte,
  output wire [11:0] pc,address_ram
  );

//conexiones internas en el procesador
wire[11:0] PC;
wire[7:0] PROGRAM_BYTE;
wire[3:0] INSTR,OPRND;
wire[11:0]address_ram = {OPRND,PROGRAM_BYTE};

wire C_FLAG,Z_FLAG,PHASE;
wire[6:0] DECODE_address = {PHASE,C_FLAG,Z_FLAG,INSTR}
wire[12:0] SEÑALES_DE_CONTROL;

wire[3:0] ACCU;
wire[3:0] ALU_OUT;
wire ALUC,ALUZ;

//Bloque DECODE


endmodule
