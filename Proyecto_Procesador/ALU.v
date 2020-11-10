//Jose Luis Alvarez Pineda
//19392
//Codigo de la ALU especifico para el proyecto del microprocesador

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
