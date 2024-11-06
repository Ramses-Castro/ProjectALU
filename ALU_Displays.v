module ALU_Displays #(
    parameter WIDTH = 3 // Definici�n del par�metro WIDTH
)(
    input mclk,                      // Esto se conecta a la entrada de selecci�n del multiplexor y a los displays pero con not en uno
    output [3:0] select_disp,        // Selecci�n del display

    input [WIDTH-1:0] in1, in2,      // Entradas A y B de la ALU (in1 e in2)
    input [1:0] op,                  // C�digo de operaci�n

    output zero,                 // Se�al de resultado cero (flag zero)
    output error,                // Se�al de error

    // Segmentos del display
    output AE,
    output BE,
    output CE,
    output DE,
    output EE,
    output FE,
    output GE

);



// Se�ales internas para conectar las salidas de la ALU y la entrada del multiplexor
wire [3:0] num1mux;
wire [3:0] num2mux;
wire zerow;
wire errorw;

// Instanciaci�n de los m�dulos
ALU #(.WIDTH(3)) Etapa0 (
    .in1(in1), 
    .in2(in2), 
    .op(op), 
    .dec_bin(num1mux), 
    .unis_bin(num2mux), 
    .zero(zerow), 
    .error(errorw)
);



Divisor_frec Etapa2 (
    .mclk(mclk),
    .q_int1(select_disp[0]),
    .q_int2(select_disp[1])
);

Multiplex_decoBCD Etapa1 (
    .A(AE),
    .B(BE),
    .C(CE),
    .D(DE),
    .E(EE),
    .F(FE),
    .G(GE),
    .J(num1mux),
    .K(num2mux),
    .SEL(select_disp[1])  // Revisa si mclk es el selector adecuado
   
);
assign select_disp[2]=1;
assign select_disp[3]=1;
assign zero=zerow;
assign error=errorw;

endmodule


