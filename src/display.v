module display(sw, clk, seg, an);
        output [6:0] seg;
        output [3:0] an;

        input[7:0] sw;
        input clk;

        wire clk_, clk_out_1, clk_out_2;
        wire [3:0] ones, tens, hundreds;
        wire [6:0] seg_ones, seg_tens, seg_hundreds;

        clk_wiz c3(clk, clk_);

        clock_divider #(8000) c1(clk_, clk_out_1);
        clock_divider #(16000) c2(clk_, clk_out_2);

        mux4v #(7) mx(seg, random_num, score, time_ones, time_tens, {clk_out_2, clk_out_1});

        assign an[3] = ~(clk_out_1 & clk_out_2);
        assign an[2] = ~(clk_out_1 & clk_out_2 == 0);
        assign an[1] = ~(clk_out_1 == 0 & clk_out_2);
        assign an[0] = ~(clk_out_1 == 0 & clk_out_2 == 0);

endmodule // top_level
