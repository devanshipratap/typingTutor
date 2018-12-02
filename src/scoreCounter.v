module scoreCounter (
    input clk,
    input reset,
    input increase,
    input enable,
    output [3:0] score
    );

    wire zero;
    wire [2:0] control;
    mux2 #(3) mx(control, 3'b011, 3'b010, increase);

    alu4 scoreAddOrSub(score, zero, , 4'b1, control);
    register #(4, 0) reg(, , clk, enable, reset);


endmodule
