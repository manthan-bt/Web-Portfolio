//Main code:
module matrix_inversion(
    input logic signed [7:0] a11, a12, a13,
    input logic signed [7:0] a21, a22, a23,
    input logic signed [7:0] a31, a32, a33,
    output logic signed [7:0] b11, b12, b13,
    output logic signed [7:0] b21, b22, b23,
    output logic signed [7:0] b31, b32, b33,
    output logic [23:0] determinant);
  assign determinant = (a11 * a22 * a33) + (a12 * a23 * a31) + (a13 * a21 * a32) - (a13 * a22 * a31) - (a12 * a21 * a33) - (a11 * a23 * a32);
  assign b11 = ((a22 * a33 - a23 * a32) / determinant);
  assign b12 = ((a13 * a32 - a12 * a33) / determinant);
  assign b13 = ((a12 * a23 - a13 * a22) / determinant);
  assign b21 = ((a23 * a31 - a21 * a33) / determinant);
  assign b22 = ((a11 * a33 - a13 * a31) / determinant);
  assign b23 = ((a13 * a21 - a11 * a23) / determinant);
  assign b31 = ((a21 * a32 - a22 * a31) / determinant);
  assign b32 = ((a12 * a31 - a11 * a32) / determinant);
  assign b33 = ((a11 * a22 - a12 * a21) / determinant);
  end
endmodule

//Test Bench Code
module matrix_inversion_tb;
logic [7:0]a11,a12,a13,a21,a22,a23,a31,a32,a33,b11,b12,b13,b21,b22,b23,b31,b32,b33;logic [23:0] determinant;
  // Instantiate the module to be tested
  matrix_inversion dut ( a11, a12, a13, a21, a22, a23, a31, a32, a33, b11, b12, b13, b21, b22, b23, b31, b32, b33,determinant);

  initial begin
    #10 a11 = 1; a12 = 0; a13 = 1;
    a21 = 0; a22 = 1; a23 = 0;
    a31 = 1; a32 = 0; a33 = 1;
    #10;
  $finish;
  end
endmodule
