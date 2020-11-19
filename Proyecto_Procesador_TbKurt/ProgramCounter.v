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

  if(reset == 1) begin//reiniciar el contador
  Y <= 12'b0;
  end

  else if(LOAD == 1) begin//precargar el valor en el contador
  Y <= Bload;
  end

  else if(ENABLE == 1)begin//contar normlamente
  Y <= Y + 1;
  end

  end
endmodule
