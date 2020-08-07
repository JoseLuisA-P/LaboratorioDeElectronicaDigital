////////////////////////////////////////////////////////////////////////////////
//Jose Luis Alvarez Pineda
//19392
//Ingenieria mecatronica
//electronica digital
////////////////////////////////////////////////////////////////////////////////
module AlamB(
  output reg Y, //registro porque tiene que guardar su estado
  input wire A,B,C);

    always @ (A,B,C) begin

        if (A == 1) begin //begin y end para poder anidar

          if (B == 0) Y = 1; //condiciones simples pueden no llevar el begin y end

          else if (C == 1) Y = 1;

          else Y = 0;

        end

        else if (A == 0) Y = 0;
    end

endmodule
