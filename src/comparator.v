module comparator (
    output equals,
    input [15:0] keycode,
    input [3:0] random
    );

    wire zero = keycode[0] & ~keycode[1] & keycode[2] & ~keycode[3] & ~keycode[4] & ~keycode[5] & keycode[6];
    wire one = ~keycode[0] & keycode[1] & keycode[2] & ~keycode[3] & keycode[4] & ~keycode[5] & ~keycode[6];
    wire two = ~keycode[0] & keycode[1] & keycode[2] & keycode[3] & keycode[4] & ~keycode[5] & ~keycode[6];
    wire three = ~keycode[0] & keycode[1] & keycode[2] & ~keycode[3] & ~keycode[4] & keycode[5] & ~keycode[6];
    wire four = keycode[0] & ~keycode[1] & keycode[2] & ~keycode[3] & ~keycode[4] & keycode[5] & ~keycode[6];
    wire five = ~keycode[0] & keycode[1] & keycode[2] & keycode[3] & ~keycode[4] & keycode[5] & ~keycode[6];
    wire six = ~keycode[0] & keycode[1] & keycode[2] & ~keycode[3] & keycode[4] & keycode[5] & ~keycode[6];
    wire seven = keycode[0] & ~keycode[1] & keycode[2] & keycode[3] & keycode[4] & keycode[5] & ~keycode[6];
    wire eight = ~keycode[0] & keycode[1] & keycode[2] & keycode[3] & keycode[4] & keycode[5] & ~keycode[6];
    wire nine = ~keycode[0] & keycode[1] & keycode[2] & ~keycode[3] & ~keycode[4] & ~keycode[5] & keycode[6];

    assign equals = zero & (random == 4'b0) | one & (random == 4'b1) | two & (random == 4'b10) | three & (random == 4'b11) | four & (random == 4'b100) | five & (random == 4'b101) | six & (random == 4'b110) | seven & (random == 4'b111) | eight & (random == 4'b1000) | nine & (random == 4'b1001);

endmodule // comparator
