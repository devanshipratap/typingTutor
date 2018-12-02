module register(q, d, clk, enable, reset);

    parameter
        width = 1,
        reset_value = 0;

    output [(width-1):0] q;
    input  [(width-1):0] d;
    input  clk, enable, reset;

    always @(reset)
        if (reset == 1'b1)
            q <= reset_value;

    always @(posedge clk)
        if ((reset == 1'b0) && (enable == 1'b1))
            q <= d;

endmodule // register
