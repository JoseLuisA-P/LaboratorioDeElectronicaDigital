//Jose Luis Alvarez Pineda
//19392
//Seccion 21
//FF de multiples bits del proyecto del microprocesador

module Flags(
  input wire clk,reset,enable,
  input wire [1:0] D,
  output reg [1:0] Y);

  always @ (posedge clk, posedge reset) begin
    if (reset == 1) Y <= 0;
    else if(enable == 1) Y <= D;
    else Y <= Y;
  end

endmodule

module ACCU(
  input wire clk,reset,enable,
  input wire [3:0] D,
  output reg [3:0] Y);

  always @ (posedge clk, posedge reset) begin
    if (reset == 1) Y <= 0;
    else if(enable == 1) Y <= D;
    else Y <= Y;
  end

endmodule

module Outputs(
  input wire clk,reset,enable,
  input wire [3:0] D,
  output reg [3:0] Y);

  always @ (posedge clk, posedge reset) begin
    if (reset == 1) Y <= 0;
    else if(enable == 1) Y <= D;
    else Y <= Y;
  end

endmodule

module Fetch(
  input wire clk,reset,enable,
  input wire [7:0] D,
  output reg [7:0] Y);

  always @ (posedge clk, posedge reset) begin
    if (reset) Y <= 0;
    else if(enable) Y <= D;
  end

endmodule
