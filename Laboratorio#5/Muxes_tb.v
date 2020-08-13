///////////////////////////////////////////////////////////////////////////////
//Jose Luis Alvarez Pineda
//19392
//Electronica digital
// Muxes para el laboratorio 5
///////////////////////////////////////////////////////////////////////////////
module testbench();

  reg A1,B1,C1;
  wire Y1;

  //MUX 2:1 de la tabla01
  MUX2T1 sel21(Y1, A1, B1, C1);

//Combinaciones para el MUX 2:1 de la tabla 01
    initial begin
    $display("\n\n");
    $display("TABLA 01 / MUX 2:1");
    $display("A| B| C| Y");
    $monitor("%b| %b| %b| %b", A1, B1, C1, Y1);
    A1=0; B1=0; C1=0;
    #1 A1=0; B1=0; C1=1;
    #1 A1=0; B1=1; C1=0;
    #1 A1=0; B1=1; C1=1;
    #1 A1=1; B1=0; C1=0;
    #1 A1=1; B1=0; C1=1;
    #1 A1=1; B1=1; C1=0;
    #1 A1=1; B1=1; C1=1;
    end

    initial begin
    #10 $finish;
    end

endmodule
