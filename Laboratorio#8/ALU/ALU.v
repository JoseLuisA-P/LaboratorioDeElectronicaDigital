///////////////////////////////////////////////////////////////////////////////
//JOSE LUIS ALVAREZ PINEDA
//19392
//Laboratorio electronica digital
//ALU laboratorio #08
///////////////////////////////////////////////////////////////////////////////

module ALU #(parameter N = 4) //Parametro para el tamaño de los bits en las entradas
(
  input wire [2:0] sel,
  input wire[N-1:0] A,
  input wire[N-1:0] B,
  output reg[N-1:0] Y
  );


  always @ ( sel, A, B ) begin
  case (sel)
    3'b000: Y = A & B; // and logico
    3'b001: Y = A | B; // or logico
    3'b010: Y = A + B; // suma aritmetica
    3'b011: Y = 0; // no se usa por eleccion se coloca en 0
    3'b100: Y = A & ~B; // and logico con b negado
    3'b101: Y = A | ~B ; // or logico con b negado
    3'b110: Y = A - B; // resta aritmetica
    3'b111: Y = (A<B)? 'b1: 'b0; //si A es menor que B da 1, de lo contrario 0
    default: Y = 0; //si entra cualquier otro valor es 0 por eleccion
  endcase

  end
endmodule
