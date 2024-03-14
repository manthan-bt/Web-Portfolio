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
