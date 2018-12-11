module top(
    input         clk,
    input         PS2Data,
    input         PS2Clk,
    output [6:0] seg,
    output [3:0] an

);
    wire [15:0] keycode;

    decoder bs(clk, PS2Data, PS2Clk, keycode);


    bin2led b1(seg, an, keycode);

endmodule
