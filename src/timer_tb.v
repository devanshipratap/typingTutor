module timer_tb ();

    wire [3:0] newTime;
    reg reset;
    reg enable;
    reg clk;
    timer tm(clk, reset, enable, newTime);

    initial begin
        $dumpfile("timer.vcd");
        $dumpvars(0, tm);

        enable <= 1; # 10;
        reset <= 0; # 10;
        clk <= 1;
        // enable <= 0; # 10;
        // reset <= 1; # 10;

        #1000 $finish;
    end

    always
        #20 clk=~clk;


endmodule // timer_tb
