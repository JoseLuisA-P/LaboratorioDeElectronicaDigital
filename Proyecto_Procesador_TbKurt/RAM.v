module RAM(
  input wire[11:0] direccion,
  input wire[3:0] datain,
  input wire cs,we,
  inout [3:0] data
  );

  reg[3:0] memoria[0:4095];
  reg[3:0] data_out;

  assign data = (cs && !we) ? data_out:4'bzzzz;

always @ (*) begin

    if (cs && we)  begin
      memoria[direccion] <= datain;
    end

    else if (cs && !we) begin
       data_out <= memoria[direccion];
    end

end

endmodule
