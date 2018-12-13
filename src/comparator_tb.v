module comparator_tb ();
    wire equals;
    reg [15:0] keycode;
    reg [3:0] random;

    comparator cm(equals, keycode, random);

    initial begin
        $dumpfile("cm.vcd");
        $dumpvars(0, cm);

        random <= 4'b1001;   # 10;
        keycode <= 8'h46;     # 10;

        #1000 $finish;

    end
    //
    // always
    //     #20 clk=~clk;

endmodule
