////////////////////////////////////////////////////////////////
//Jose Luis Alvarez Pineda
//Carne 19392
//Ingenieria mecatronica
//Electronica digital
////////////////////////////////////////////////////////////////
module bancodepruebas();

  //variables para probar el modulo asociado a la tabla 01 y tabla02
  reg a,b,c;
  wire sal01, sal02;
  //variables para probar el modulo asociado a la tabla 03 y tabla 04
  reg A, B, C, D;
  wire sal03, sal04;
  //
  reg A2, B2, C2, D2;
  wire sal21, sal22, sal23, sal24;

  //
  T01 tab1(sal01,a,b,c);
  //
  T02 tab2(sal02,a,b,c);
  //
  T03 tab3(sal03,A,B,C,D);
  //
  T04 tab4(sal04,A,B,C,D);
  //
  EJ021 form1(sal21,A2,B2,C2,D2);
  //
  EJ022 form2(sal22,A2,B2,C2);
  //
  EJ023 form3(sal23,A2,B2,C2,D2);
  //
  EJ024 form4(sal24,A2,B2,C2);

  //bloque initial para prueba de tabla01
  initial begin
  $display("\n\n\n");
  $display("///////////");
  $display("COMIENZO TABLA 01");
  $display("///////////");
  $display("A| B| C| Y");
  $monitor("%b| %b| %b| %b",a, b, c, sal01);
  a=0; b=0; c=0;
  #1 a=0; b=0; c=1;
  #1 a=0; b=1; c=0;
  #1 a=0; b=1; c=1;
  #1 a=1; b=0; c=0;
  #1 a=1; b=0; c=1;
  #1 a=1; b=1; c=0;
  #1 a=1; b=1; c=1;
  end

  //bloque initial para prueba de tabla02
  initial begin
  #10
  $display("///////////");
  $display("COMIENZO TABLA 02");
  $display("///////////");
  $display("A| B| C| Y");
  $monitor("%b| %b| %b| %b",a, b, c, sal02);
  a=0; b=0; c=0;
  #1 a=0; b=0; c=1;
  #1 a=0; b=1; c=0;
  #1 a=0; b=1; c=1;
  #1 a=1; b=0; c=0;
  #1 a=1; b=0; c=1;
  #1 a=1; b=1; c=0;
  #1 a=1; b=1; c=1;
  end

  //bloque initial para prueba de tabla03
  initial begin
  #20
  $display("///////////");
  $display("COMIENZO TABLA 03");
  $display("///////////");
  $display("A| B| C| D| Y");
  $monitor("%b| %b| %b| %b| %b",A, B, C, D, sal03);
  A=0; B=0; C=0; D=0;
  #1 A=0; B=0; C=0; D=1;
  #1 A=0; B=0; C=1; D=0;
  #1 A=0; B=0; C=1; D=1;
  #1 A=0; B=1; C=0; D=0;
  #1 A=0; B=1; C=0; D=1;
  #1 A=0; B=1; C=1; D=0;
  #1 A=0; B=1; C=1; D=1;
  #1 A=1; B=0; C=0; D=0;
  #1 A=1; B=0; C=0; D=1;
  #1 A=1; B=0; C=1; D=0;
  #1 A=1; B=0; C=1; D=1;
  #1 A=1; B=1; C=0; D=0;
  #1 A=1; B=1; C=0; D=1;
  #1 A=1; B=1; C=1; D=0;
  #1 A=1; B=1; C=1; D=1;
  end

  //bloque initial para prueba de tabla04
  initial begin
  #40
  $display("///////////");
  $display("COMIENZO TABLA 04");
  $display("///////////");
  $display("A| B| C| D| Y");
  $monitor("%b| %b| %b| %b| %b",A, B, C, D, sal04);
  A=0; B=0; C=0; D=0;
  #1 A=0; B=0; C=0; D=1;
  #1 A=0; B=0; C=1; D=0;
  #1 A=0; B=0; C=1; D=1;
  #1 A=0; B=1; C=0; D=0;
  #1 A=0; B=1; C=0; D=1;
  #1 A=0; B=1; C=1; D=0;
  #1 A=0; B=1; C=1; D=1;
  #1 A=1; B=0; C=0; D=0;
  #1 A=1; B=0; C=0; D=1;
  #1 A=1; B=0; C=1; D=0;
  #1 A=1; B=0; C=1; D=1;
  #1 A=1; B=1; C=0; D=0;
  #1 A=1; B=1; C=0; D=1;
  #1 A=1; B=1; C=1; D=0;
  #1 A=1; B=1; C=1; D=1;
  end

  //bloque initial para prueba de la formula 1, ejercicio 2
  initial begin
  #60
  $display("\n\n\n");
  $display("///////////");
  $display("COMIENZO DEL EJERCICIO2 F1");
  $display("///////////");
  $display("A| B| C| D| Y");
  $monitor("%b| %b| %b| %b| %b",A2, B2, C2, D2, sal21);
  A2=0; B2=0; C2=0; D2=0;
  #1 A2=0; B2=0; C2=0; D2=1;
  #1 A2=0; B2=0; C2=1; D2=0;
  #1 A2=0; B2=0; C2=1; D2=1;
  #1 A2=0; B2=1; C2=0; D2=0;
  #1 A2=0; B2=1; C2=0; D2=1;
  #1 A2=0; B2=1; C2=1; D2=0;
  #1 A2=0; B2=1; C2=1; D2=1;
  #1 A2=1; B2=0; C2=0; D2=0;
  #1 A2=1; B2=0; C2=0; D2=1;
  #1 A2=1; B2=0; C2=1; D2=0;
  #1 A2=1; B2=0; C2=1; D2=1;
  #1 A2=1; B2=1; C2=0; D2=0;
  #1 A2=1; B2=1; C2=0; D2=1;
  #1 A2=1; B2=1; C2=1; D2=0;
  #1 A2=1; B2=1; C2=1; D2=1;
  end

  //bloque initial para prueba de la formula 2, ejercicio 2
  initial begin
  #80
  $display("///////////");
  $display("COMIENZO DEL EJERCICIO2 F2");
  $display("///////////");
  $display("A| B| C| Y");
  $monitor("%b| %b| %b| %b",A2, B2, C2, sal22);
  A2=0; B2=0; C2=0;
  #1 A2=0; B2=0; C2=1;
  #1 A2=0; B2=1; C2=0;
  #1 A2=0; B2=1; C2=1;
  #1 A2=1; B2=0; C2=0;
  #1 A2=1; B2=0; C2=1;
  #1 A2=1; B2=1; C2=0;
  #1 A2=1; B2=1; C2=1;
  end

  //bloque initial para prueba de la formula 3, ejercicio 2
  initial begin
  #90
  $display("///////////");
  $display("COMIENZO DEL EJERCICIO2 F3");
  $display("///////////");
  $display("A| B| C| D| Y");
  $monitor("%b| %b| %b| %b| %b",A2, B2, C2, D2, sal23);
  A2=0; B2=0; C2=0; D2=0;
  #1 A2=0; B2=0; C2=0; D2=1;
  #1 A2=0; B2=0; C2=1; D2=0;
  #1 A2=0; B2=0; C2=1; D2=1;
  #1 A2=0; B2=1; C2=0; D2=0;
  #1 A2=0; B2=1; C2=0; D2=1;
  #1 A2=0; B2=1; C2=1; D2=0;
  #1 A2=0; B2=1; C2=1; D2=1;
  #1 A2=1; B2=0; C2=0; D2=0;
  #1 A2=1; B2=0; C2=0; D2=1;
  #1 A2=1; B2=0; C2=1; D2=0;
  #1 A2=1; B2=0; C2=1; D2=1;
  #1 A2=1; B2=1; C2=0; D2=0;
  #1 A2=1; B2=1; C2=0; D2=1;
  #1 A2=1; B2=1; C2=1; D2=0;
  #1 A2=1; B2=1; C2=1; D2=1;
  end

  //bloque initial para prueba de la formula 4, ejercicio 2
  initial begin
  #110
  $display("///////////");
  $display("COMIENZO DEL EJERCICIO2 F4");
  $display("///////////");
  $display("A| B| C| Y");
  $monitor("%b| %b| %b| %b",A2, B2, C2, sal24);
  A2=0; B2=0; C2=0;
  #1 A2=0; B2=0; C2=1;
  #1 A2=0; B2=1; C2=0;
  #1 A2=0; B2=1; C2=1;
  #1 A2=1; B2=0; C2=0;
  #1 A2=1; B2=0; C2=1;
  #1 A2=1; B2=1; C2=0;
  #1 A2=1; B2=1; C2=1;
  end

  initial
    #120 $finish;

  initial begin
  $dumpfile("Modulos01-02_tb.vcd");
  $dumpvars(0, bancodepruebas);
  end

endmodule
