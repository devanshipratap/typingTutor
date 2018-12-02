module bin2led (
    output[6:0] seg,
    output[3:0] an,
    input[15:0] keycode
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

    assign seg[0] = ~(zero | two | three | five | six | seven | eight | nine);
    assign seg[1] = ~(zero | one | two | three | four | seven | eight | nine);
    assign seg[2] = ~(zero | one | three | four | five | six | seven | eight | nine);
    assign seg[3] = ~(zero | two | three | five | six | eight | nine);
    assign seg[4] = ~(zero | two | six | eight);
    assign seg[5] = ~(zero | four | five | six | eight | nine);
    assign seg[6] = ~(two | three | four | five | six | eight | nine);

    assign an[3] = 1;
    assign an[2] = 1;
    assign an[1] = 1;
    assign an[0] = ~(zero | one | two | three | four | five | six | seven | eight | nine);

endmodule // bin2led
