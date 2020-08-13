///////////////////////////////////////////////////////////////////////////////
//Jose Luis Alvarez Pineda
//19392
//Electronica digital
// Muxes para el laboratorio 5
///////////////////////////////////////////////////////////////////////////////
module testbench();

  reg A1,B1,C1, A2, B2, C2;
  wire Y1, Y2, Y3, Y21;

  //MUX 2:1 de la tabla01
  MUX2T1 sel21(Y1, A1, B1, C1);
  //MUX 4:1 de la tabla01
  MUX4T1 sel41(Y2, A1, B1, C1);
  //MUX 8:1 de la tabla01
  MUX8T1 sel81(Y3, A1, B1, C1);

  //MUX 2:1 de la tabla02
  MUX2T2 sel22(Y21, A2, B2, C2);

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

//combinaciones para el MUX4:1 de la tabla 01
    initial begin
    #10
    $display("\n");
    $display("TABLA 01 / MUX 4:1");
    $display("A| B| C| Y");
    $monitor("%b| %b| %b| %b", A1, B1, C1, Y2);
    A1=0; B1=0; C1=0;
    #1 A1=0; B1=0; C1=1;
    #1 A1=0; B1=1; C1=0;
    #1 A1=0; B1=1; C1=1;
    #1 A1=1; B1=0; C1=0;
    #1 A1=1; B1=0; C1=1;
    #1 A1=1; B1=1; C1=0;
    #1 A1=1; B1=1; C1=1;
    end

//combinaciones para el MUX8:1 de la tabla 01
    initial begin
    #20
    $display("\n");
    $display("TABLA 01 / MUX 8:1");
    $display("A| B| C| Y");
    $monitor("%b| %b| %b| %b", A1, B1, C1, Y3);
    A1=0; B1=0; C1=0;
    #1 A1=0; B1=0; C1=1;
    #1 A1=0; B1=1; C1=0;
    #1 A1=0; B1=1; C1=1;
    #1 A1=1; B1=0; C1=0;
    #1 A1=1; B1=0; C1=1;
    #1 A1=1; B1=1; C1=0;
    #1 A1=1; B1=1; C1=1;
    end

//combinaciones para el MUX2:1 de la tabla 02
    initial begin
    #30
    $display("\n\n");
    $display("------------------");
    $display("TABLA 02 / MUX 2:1");
    $display("A| B| C| Y");
    $monitor("%b| %b| %b| %b", A2, B2, C2, Y21);
    A2=0; B2=0; C2=0;
    #1 A2=0; B2=0; C2=1;
    #1 A2=0; B2=1; C2=0;
    #1 A2=0; B2=1; C2=1;
    #1 A2=1; B2=0; C2=0;
    #1 A2=1; B2=0; C2=1;
    #1 A2=1; B2=1; C2=0;
    #1 A2=1; B2=1; C2=1;
    end

    initial begin
    #40 $finish;
    end

endmodule
