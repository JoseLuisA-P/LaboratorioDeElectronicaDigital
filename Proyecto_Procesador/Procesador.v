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
wire[11:0] ADDRESS_ram = {OPRND,PROGRAM_BYTE};

wire C_FLAG,Z_FLAG,PHASE;
wire[6:0] DECODE_address = {PHASE,C_FLAG,Z_FLAG,INSTR}
wire[12:0] SC; //SEÑALES DE CONTROL

wire[3:0] ACCUU;
wire[3:0] ALU_OUT;
wire[3:0] DATA_BUS;
wire ALUC,ALUZ;

//asignacion de salidas
assign c_flag = ALUC;
assign z_flag = ALUZ;
assign instr = INSTR;
assign oprnd = OPRND;
assign data_bus = DATA_BUS;
assign accu = ACCUU;
assign program_byte = PROGRAM_BYTE;
assign pc = PC;
assign address_ram = ADDRESS_ram;

//Bloque DECODE
ROMcase dicode(DECODE_address,SC);

//bloque de phase y de flags
phase FASE(clock,reset,PHASE);
Flags banderas(clock,reset,SC[9],{ALUC,ALUZ},{C_FLAG,Z_FLAG});

//bloque del ProgramCounter, programROM 64X8 y FETCH
ProgramCounter contador(reset,clock,SC[11],SC[12],ADDRESS_ram,PC);
ROM opcode(PC,PROGRAM_BYTE);
Fetch ftch(clock,reset,PHASE,PROGRAM_BYTE,{INSTR,OPRND});

//bloque de la RAM
RAM memram(ADDRESS_ram,DATA_BUS,SC[5],SC[4],clock,DATA_BUS);

//bloque del BusDriver conectado al fetch
tribuff delfetch(SC[1],OPRND,DATA_BUS);

//bloque del BusDriver conectado a la ALU
tribuff deALU(SC[3],ALU_OUT,DATA_BUS);

//bloque del BusDriver entradas de los pushbuttons
tribuff pushes(SC[2],pushbuttons,DATA_BUS);

//bloque de la ALU y el accu
ALU operaciones(ACCUU,DATA_BUS,{SC[8],SC[7],SC[6]},ALU_OUT,ALUC,ALUZ);
ACCU acumulador(clock,reset,SC[10],ALU_OUT,ACCUU);

//bloque de la salida OUT
Outputs salida(clock,reset,SC[0],DATA_BUS,FF_out);

endmodule
