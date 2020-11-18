//Jose Luis Alvarez Pineda
//19392
//Codigo de la ALU especifico para el proyecto del microprocesador

module ALU(
  input wire[3:0] A, B,
  input wire[2:0] selector,
  output wire [3:0] Y,
  output reg C, ZERO);

  //variable para manejar el carry
  reg[4:0] RESalu;//para darle el dato a la salida y manejar el carry

      always @ ( selector, A, B) begin

      case (selector)
        3'b100: RESalu = {1'b0,~(A & B)}; // nand logico
        3'b011: RESalu = A + B; //suma de A y B
        3'b000: RESalu = A; //pasa el valor de A
        3'b010: RESalu =  B; //pasa el valor de B
        3'b001: RESalu = A - B;//resta de A y B
        default: RESalu = 0;//si entra cualquier otro valor es 0 por eleccion
      endcase

      if (RESalu[3:0] == 0) begin
        ZERO = 1;
      end
      else begin
        ZERO = 0;
      end

      C <= RESalu[4];

      end

    assign Y = RESalu[3:0];



endmodule
