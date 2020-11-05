//JOse Luis ALvarez Pineda
//19392
//seccion 21
//Laboratorio #10 ejercicio #2

//modulo del
module BusDriver(
  input wire enable,
  input wire [3:0] D,
  output wire [3:0] Y);

  assign Y = enable? D:'bz;

endmodule

//modulo de la ACCU
module ACCU(
  input wire clk,reset,enable,
  input wire[3:0] D,
  output reg[3:0] Y);

  always @ (posedge clk, posedge reset) begin
    if (reset == 1) Y <= 0;
    else if(enable == 1) Y <= D;
    else Y <= Y;
  end

endmodule

//modulo de la ALU
module ALU(
  input wire[3:0] A, B,
  input wire[2:0] selector,
  output wire [3:0] Y,
  output reg C, ZERO);

  //variable para manejar el carry
  reg[3:0] RESalu;//para darle el dato a la salida
  reg[4:0] carry;//para manejar el carry de las operaciones

  assign Y = RESalu;

      always @ ( selector, A, B) begin

      case (selector)
        3'b100: RESalu = ~(A & B); // and logico
        3'b011: begin RESalu = A + B; carry = {1'b0,A} + {1'b0,B}; end//suma de A y B
        3'b000: RESalu = A; //pasa el valor de A
        3'b010: RESalu =  B; //pasa el valor de B
        3'b001: begin RESalu = A - B; carry = {1'b0,A} - {1'b0,B}; end//resta de A y B
        default: begin RESalu = 0; carry = 0; end //si entra cualquier otro valor es 0 por eleccion
      endcase

      if (RESalu == 0) begin
        ZERO = 1;
      end
      else begin
        ZERO = 0;
      end

      if (carry[4] == 1) begin
        C = 1;
      end
      else begin
        C = 0;
      end

      end

endmodule

module Interconexion(
  input wire ENBusIn,ENBusOut,ENAccu,clk,reset,
  input wire [2:0] selectorALU,
  input wire [3:0] INBUS,
  output wire [1:0] CZ,
  output wire [3:0] Acum,
  output wire [3:0] SALBUSOut);

  wire[3:0] data_bus,ALUOUT;
//bus de entrada
BusDriver BUSIN(.enable(ENBusIn),.D(INBUS),.Y(data_bus));
//bus de salida
BusDriver BUSOUT(.enable(ENBusOut),.D(ALUOUT),.Y(SALBUSOut));
//accumulador
ACCU acumulador(.clk(clk),.reset(reset),.enable(ENAccu),.D(ALUOUT),.Y(Acum));
//ALU
ALU operaciones(.selector(selectorALU),.A(Acum),.B(data_bus),.Y(ALUOUT),.ZERO(CZ[0]),.C(CZ[1]));

endmodule
