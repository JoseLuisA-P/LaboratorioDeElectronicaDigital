////////////////////////////////////////////////////////////////////////////////
//Jose Luis Alvarez Pineda
//19392
//Ingenieria mecatronica
//electronica digital
////////////////////////////////////////////////////////////////////////////////

module testbench();

reg A,B,C;
wire alarma;

AlamB alarm1(alarma,A,B,C);

initial begin
$display("A| B| C| Alarma");
$monitor("%b| %b| %b| %b",A,B,C,alarma);
A=0; B=0; C=0;
#1A=0; B=0; C=1;
#1A=0; B=1; C=0;
#1A=0; B=1; C=1;
#1A=1; B=0; C=0;
#1A=1; B=0; C=1;
#1A=1; B=1; C=0;
#1A=1; B=1; C=1;
$finish;
end

endmodule
