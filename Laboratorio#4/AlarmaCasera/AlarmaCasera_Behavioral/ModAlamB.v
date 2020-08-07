////////////////////////////////////////////////////////////////////////////////
//Jose Luis Alvarez Pineda
//19392
//Ingenieria mecatronica
//electronica digital
////////////////////////////////////////////////////////////////////////////////
module AlamB(
  output wire Y,
  input wire A,B,C);

    always @ (A,B,C) begin

        if (A == 1) begin

          if (B == 0) Y = 1;

          else if (C == 1) Y = 1;

          else Y = 0;

        end

    end

endmodule
