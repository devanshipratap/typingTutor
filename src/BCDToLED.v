module BCDToLED(seg, x);
        output [6:0] seg;
        input [3:0] x;

        assign seg[0] = (x[2] & ~x[1] & ~x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]);
        assign seg[1] = (x[2] & x[1] & ~x[0]) | (x[2] & ~x[1] & x[0]);
        assign seg[2] = (~x[2] & x[1] & ~x[0]);
        assign seg[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (x[2] & x[1] & x[0]) | (x[2] & ~x[1] & ~x[0]);
        assign seg[4] = (x[0]) | (x[2] & ~x [1] & ~x[0]);
        assign seg[5] = (~x[3] & ~x[2] & x[0]) | (x[1] & x[0]) | (~x[2] & x[1]);
        assign seg[6] = (~x[3] & ~x[2] & ~x[1]) | (x[2] & x[1] & x[0]);

endmodule // BCDToLED
