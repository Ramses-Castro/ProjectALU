module Multiplex_decoBCD (
    // Segmentos del display
    output A,
    output B,
    output C,
    output D,
    output E,
    output F,
    output G,

    // N�meros
    input [3:0] J,
    input [3:0] K,

    // Selector de n�mero
    input SEL // A este se va a conectar la se�al de reloj

);

wire [3:0] SAW; // N�mero que se mostrar�



// Instanciaci�n del Multiplexor2_1
Multiplexor2_1 Etapa0 (
    .J(J),
    .K(K),
    .EL(SEL),
    .SA(SAW)
);

// Instanciaci�n del DecodificadorBCD
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


