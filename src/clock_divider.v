module clock_divider(input clk_in, output clk_out);

    parameter
      freq = 500;

    reg [31:0] counter = 1;
    reg temp_clk = 0;
    always @ (posedge(clk_in))
    begin
        if(counter == freq)
        begin
                counter <= 1;
                temp_clk <= ~temp_clk;
        end
        else
                counter <= counter+1;
        end
        assign clk_out = temp_clk ;
endmodule
