//module register(q, d, clk, enable, reset);

//    parameter
//        width = 1,
//        reset_value = 0;

////    output [(width-1):0] q;
//    output reg    [(width-1):0] q;
//    input  [(width-1):0] d;
//    input  clk, enable, reset;

//    always @(reset)
//    begin
//        if (reset == 1'b1)
//        begin
//            q <= reset_value;
//        end
//    end

//    always @(posedge clk)
//    begin
//        if ((reset == 1'b0) && (enable == 1'b1))
//        begin
//            q <= d;
//        end
//    end

//endmodule // register
module register(q, d, clk, enable, reset);

    parameter
        width = 32,
        reset_value = 0;

    output reg    [(width-1):0] q;
    input  [(width-1):0] d;
    input  clk, enable, reset;

    always @(posedge clk or posedge reset)
        if (reset == 1'b1)
            q <= reset_value;
        else if (enable == 1'b1)
            q <= d;

endmodule // register