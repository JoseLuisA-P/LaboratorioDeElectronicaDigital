module bancodepruebas();

  //variables para probar el modulo asociado a la tabla 01 y tabla02
  reg a,b,c;
  wire sal01, sal02;
  //variables para probar el modulo asociado a la tabla 03 y tabla 04
  reg A,B,C,D;
  wire sal03, sal04;

  //
  T01 tab1(sal01,a,b,c);
  //
  T02 tab2(sal02,a,b,c);
  //
  T03 tab3(sal03,A,B,C,D);

  //bloque initial para prueba de tabla01
  initial begin
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

  initial
    #100 $finish;

endmodule
