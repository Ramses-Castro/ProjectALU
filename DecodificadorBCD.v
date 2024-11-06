module DecodificadorBCD (
    output reg A,
    output reg B,
    output reg C,
    output reg D,
    output reg E,
    output reg F,
    output reg G,
    input W,
    input X,
    input Y,
    input Z
);

wire [3:0] data_in;  // Agrupamos las entradas en un bus de 4 bits para el case

assign data_in = {W, X, Y, Z};  // Asignamos las 4 entradas en un solo bus de 4 bits

always @(*) begin
    // Inicializar todos los segmentos a apagados por defecto
    {A, B, C, D, E, F, G} = 7'b1111111; 

    case (data_in)
        4'b0000: {A, B, C, D, E, F, G} = 7'b0000001;  // N�mero 0
        4'b0001: {A, B, C, D, E, F, G} = 7'b1001111;  // N�mero 1
        4'b0010: {A, B, C, D, E, F, G} = 7'b0010010;  // N�mero 2
        4'b0011: {A, B, C, D, E, F, G} = 7'b0000110;  // N�mero 3
        4'b0100: {A, B, C, D, E, F, G} = 7'b1001100;  // N�mero 4
        4'b0101: {A, B, C, D, E, F, G} = 7'b0100100;  // N�mero 5
        4'b0110: {A, B, C, D, E, F, G} = 7'b0100000;  // N�mero 6
        4'b0111: {A, B, C, D, E, F, G} = 7'b0001111;  // N�mero 7
        4'b1000: {A, B, C, D, E, F, G} = 7'b0000000;  // N�mero 8
        4'b1001: {A, B, C, D, E, F, G} = 7'b0000100;  // N�mero 9

    endcase
end

endmodule
