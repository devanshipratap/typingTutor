module top(
    input         clk,
    input         PS2Data,
    input         PS2Clk,
    output  [6:0] seg,
    output  [3:0] an

);
  wire clk_;

    wire [3:0] num, newnum;
//    reg[3:0] num;

    wire [15:0] keycode;
    wire change;
            clock_divider #(800) c1(clk, clk_);

    decoder bs(clk, PS2Data, PS2Clk, keycode);

    randomNumGen rm(clk, newnum);

    register #(4) reg1(num, newnum, clk_, change, 1'b0);

    BCDToLED bitch(seg, num);
    bin2led b1(change, keycode);
    assign an[0] = 1'b0;

endmodule
