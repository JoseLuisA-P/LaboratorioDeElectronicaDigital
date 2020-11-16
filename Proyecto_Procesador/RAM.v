module RAM(
  input wire[11:0] direccion,
  input wire[3:0] datain,
  input wire cs,we,clock,
  output reg[3:0] data_out
  );

  reg[3:0] memoria[0:4095];

always @ ( posedge clock ) begin

    if (cs == 1 && we == 1) begin
      memoria[direccion] <= datain;
    end

    else if (cs == 1 && we == 0) begin
      assign data_out = memoria[direccion];
    end

    else data_out = 4'bzzzz;

end

endmodule
