module ALU #(
  parameter WIDTH = 3
)(
  input [WIDTH-1:0] in1, in2,       // Entradas A y B de la ALU (in1 e in2)
  input [1:0] op,                   // C�digo de operaci�n
  output reg [3:0] dec_bin,         // Decenas del resultado
  output reg [3:0] unis_bin,        // Unidades del resultado
  output reg zero,                  // Se�al de resultado cero (flag zero)
  output reg error                  // Se�al de error (flag error divisi�n por cero o datos inv�lidos)
);

reg [5:0] out; // Variable para almacenar el resultado de la operaci�n en decimal
reg [3:0] decenas_dec, unidades_dec; // Variables para separar las unidades y decenas en decimal antes de cambiarlas a binario

// Definici�n de operaciones para el selector
localparam SUM = 2'b00;
localparam SUB = 2'b01;
localparam MUL = 2'b10;
localparam DIV = 2'b11;

always @(*) begin
  // Inicializar flags de error y zero en 0
  error = 0;
  zero = 0;

  // Operaciones de la ALU
  case (op)
    SUM: begin
      out = in1 + in2;  // Sumar
                    // Separar las decenas y unidades del resultado en decimal
              decenas_dec = out / 10;
              unidades_dec = out % 10;
            
              // Asignar las decenas y unidades a la salida en binario
              dec_bin = decenas_dec;
              unis_bin = unidades_dec;
    end
    SUB: begin
      if (in1 >= in2) begin
        out = in1 - in2;  // Restar si in1 >= in2
          // Separar las decenas y unidades del resultado en decimal
              decenas_dec = out / 10;
              unidades_dec = out % 10;
            
              // Asignar las decenas y unidades a la salida en binario
              dec_bin = decenas_dec;
              unis_bin = unidades_dec;
      end else begin
        error = 1;        // Error si el resultado es negativo
        out = 6'b000000;  // Asignar 0 si hay error
        dec_bin=4'b0000;
        unis_bin=4'b0000;
      end
    end
    MUL: begin
      out = in1 * in2;  // Multiplicar
                    // Separar las decenas y unidades del resultado en decimal
              decenas_dec = out / 10;
              unidades_dec = out % 10;
            
              // Asignar las decenas y unidades a la salida en binario
              dec_bin = decenas_dec;
              unis_bin = unidades_dec;
    end
    DIV: begin
      if (in2 == 0) begin
        error = 1;  // Error si se intenta dividir por 0
        out = 6'b111111; // Forzar salida a ser -1 (todos 1's)
        dec_bin=4'b1111;
        unis_bin=4'b1111;
      end else begin
        out = in1 / in2;  // Dividir si no hay error
                      // Separar las decenas y unidades del resultado en decimal
              decenas_dec = out / 10;
              unidades_dec = out % 10;
            
              // Asignar las decenas y unidades a la salida en binario
              dec_bin = decenas_dec;
              unis_bin = unidades_dec;
      end
    end
    default: begin
      error = 1;  // Activar error si la operaci�n no es v�lida
      out = 6'b111111; // Forzar salida a ser -1 (todos 1's)
      dec_bin=4'b1111;
        unis_bin=4'b1111;
    end
  endcase



  // Activar la se�al zero si el resultado es 0
  if (out == 0) begin
    zero = 1;
  end
end

endmodule