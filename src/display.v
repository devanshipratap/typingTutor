module display(
        input[3:0] random_num_in,
        input[3:0] score_in,
        input[3:0] time_in,
        input clk,
        output [6:0] seg,
        output [3:0] an
        );

        wire clk_, clk_out_1, clk_out_2;
        wire [3:0] one, ten;
        wire [6:0] random_num, score, time_ones, time_tens;

        clk_wiz c3(clk, clk_); // Put in toplevel

        clock_divider #(8000) c1(clk_, clk_out_1);
        clock_divider #(16000) c2(clk_, clk_out_2);

        mux4v #(7) mx(seg, random_num, score, time_ones, time_tens, {clk_out_2, clk_out_1});

        BCDToLED random_num_bcd(random_num, random_num_in);
        BCDToLED score_bcd(score, score_in);
        DecimalDigitDecoder ddd(time_in, ten, one);
        BCDToLED ones(time_ones, one);
        BCDToLED tens(time_tens, ten);

        assign an[3] = ~(clk_out_1 & clk_out_2);
        assign an[2] = ~(clk_out_1 & clk_out_2 == 0);
        assign an[1] = ~(clk_out_1 == 0 & clk_out_2);
        assign an[0] = ~(clk_out_1 == 0 & clk_out_2 == 0);

endmodule // top_level
