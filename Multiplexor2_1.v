module Multiplexor2_1 (
    input [3:0] J,      // Entrada J de 4 bits
    input [3:0] K,      // Entrada K de 4 bits
    input EL,           // Señal de control (selector)
    output [3:0] SA     // Salida de 3 bits
);

assign SA = (EL == 1'b0) ? J[3:0] : K[3:0];  // Selección de la salida con base en EL

endmodule
