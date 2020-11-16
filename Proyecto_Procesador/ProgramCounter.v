///////////////////////////////////////////////////////////////////////////////
//JOSE LUIS ALVAREZ PINEDA
//19392
//Laboratorio electronica digital
//Contador laboratorio #08 (reutilizado para el program counter)
///////////////////////////////////////////////////////////////////////////////

module ProgramCounter(
  input wire reset, clk, LOAD, ENABLE,
  input wire [11:0] Bload,
  output reg [11:0] Y
  );

//variables
  always @ ( posedge clk, posedge reset) begin

  if(reset == 1) begin
  Y <= 12'b0;
  end

  else if(LOAD == 1) begin
  Y <= Bload;
  end

  else if(ENABLE == 1)begin
  Y <= Y + 1;
  end

  end
endmodule
