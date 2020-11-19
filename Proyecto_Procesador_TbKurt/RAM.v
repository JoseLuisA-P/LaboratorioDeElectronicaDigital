module RAM(
  input wire[11:0] direccion,
  input wire[3:0] datain,
  input wire cs,we,
  inout [3:0] data
  );

  reg[3:0] memoria[0:4095];//array de datos para las variables a almacenar
  reg[3:0] data_out;//variable para los datos de salida

  assign data = (cs && !we) ? data_out:4'bzzzz;// determina si la salida toma el valor que se lee o la coloca en alta impedancia

always @ (*) begin

    if (cs && we)  begin //si los dos son 1, entonces escribe el dato
      memoria[direccion] <= datain;
    end

    else if (cs && !we) begin// si solamente CS es 1, lee el dato y lo coloca para que pueda ser leido en la salida
       data_out <= memoria[direccion];
    end

end

endmodule
