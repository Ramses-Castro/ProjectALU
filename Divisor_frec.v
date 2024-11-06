module Divisor_frec (
    input mclk,
    output q_int1,
    output q_int2
);

reg [23:0] q;  // Señal interna para contar

// Divisor de reloj
always @(posedge mclk) begin
    q <= q + 1;
end

assign q_int1 = q[17];      // Divide a 381.47 Hz
assign q_int2 = ~q_int1;    // Complemento de q_int1 para la segunda salida

endmodule