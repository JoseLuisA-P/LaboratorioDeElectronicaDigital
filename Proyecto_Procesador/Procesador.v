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

wire[3:0] ACCUU;
wire[3:0] ALU_OUT;
wire[3:0] DATA_BUS;
wire ALUC,ALUZ;

//Bloque DECODE
ROMcase dicode(DECODE_address,SEÑALES_DE_CONTROL);

//bloque de phase y de flags
phase FASE(clock,reset,ENABLE,PHASE);//falta enable
Flags banderas(clock,reset,ENABLE,{ALUC,ALUZ},{C_FLAG,Z_FLAG});//falta enable

//bloque del ProgramCounter, programROM 64X8 y FETCH
ProgramCounter contador(reset,clock,LOAD,ENABLE,address_ram,PC); //falta enable y load
ROM opcode(PC,PROGRAM_BYTE);
Fetch ftch(clock,reset,ENABLE,PROGRAM_BYTE,{INSTR,OPRND});//falta enable

//bloque de la RAM

//bloque del BusDriver conectado al fetch
tribuff delfetch(ENABLE,OPRND,DATA_BUS);//falta enable

//bloque del BusDriver conectado a la ALU
tribuff deALU(ENABLE,ALU_OUT,DATA_BUS);//falta enable

//bloque del BusDriver entradas de los pushbuttons
tribuff pushes(ENABLE,pushbuttons,DATA_BUS);//falta enable

//bloque de la ALU y el accu
ALU operaciones(ACCUU,DATA_BUS,SELECTOR,ALU_OUT,ALUC,ALUZ);//falta selector
ACCU acumulador(clock,reset,ENABLE,ALU_OUT,ACCUU);//falta enable

endmodule
