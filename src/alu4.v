module alu (
    output [3:0] result,
    output zero,
    input A,
    input B,
    input [2:0] control
    );

   wire w0, w1, w2, w3;

   alu1 a0(result[0], w0, A[0], B[0], control[0], control);
   alu1 a1(result[1], w1, A[1], B[1], w0, control);
   alu1 a2(result[2], w2, A[2], B[2], w1, control);
   alu1 a3(result[3], w3, A[3], B[3], w2, control);

   nor n(zero, result[0], result[1], result[2], result[3]);

endmodule
