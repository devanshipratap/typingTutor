module scoreCounter (
    input clk,
    input reset,
    input increase,
    input enable,
    output [3:0] score
    );

    wire zero;
    wire [2:0] control;
    wire [3:0] oldScore;

    mux2 #(3) mx(control, 3'b011, 3'b010, increase);

    alu4 scoreAddOrSub(score, zero, oldScore, 4'b1, control);
    register #(4, 0) reg(oldScore, score, clk, enable, reset);

endmodule // scoreCounter
