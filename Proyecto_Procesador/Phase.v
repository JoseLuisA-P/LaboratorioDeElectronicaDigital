//Jose Luis Alvarez Pineda
//19392
//Seccion 21
//Laboratorio #09, construccion de un FF tipo T utilizando un FF tipo D (reutilizado para phase)

module phase(
  input wire clk,reset
  output reg Y);

  always @ (posedge clk, posedge reset) begin
    if (reset == 1) Y <= 1;

    Y <= ~Y;
  end

endmodule
