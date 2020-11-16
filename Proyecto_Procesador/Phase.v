//Jose Luis Alvarez Pineda
//19392
//Seccion 21

module Tflop(
  input wire clk,reset,
  output reg Y);

  always @ (posedge reset or posedge clk) begin
    if (reset) Y <= 0;
    else Y <= ~Y;
  end

endmodule
