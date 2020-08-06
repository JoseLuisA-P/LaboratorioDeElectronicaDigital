module bancodepruebas();

  //variables para probar el modulo asociado a la tabla 01
  reg a,b,c;
  wire sal01;

  //
  T01 tab1(sal01,a,b,c);
  //
  T02 tab2(sal02,a,b,c);

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

  initial
    #50 $finish;

endmodule
