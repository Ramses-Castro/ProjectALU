module Multiplex_decoBCD (
    // Segmentos del display
    output A,
    output B,
    output C,
    output D,
    output E,
    output F,
    output G,

    // Números
    input [3:0] J,
    input [3:0] K,

    // Selector de número
    input SEL // A este se va a conectar la señal de reloj

);

wire [3:0] SAW; // Número que se mostrará



// Instanciación del Multiplexor2_1
Multiplexor2_1 Etapa0 (
    .J(J),
    .K(K),
    .EL(SEL),
    .SA(SAW)
);

// Instanciación del DecodificadorBCD
DecodificadorBCD Etapa1 (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .E(E),
    .F(F),
    .G(G),
    .W(SAW[3]),//1111
    .X(SAW[2]),
    .Y(SAW[1]),
    .Z(SAW[0])//11111111
);

endmodule


