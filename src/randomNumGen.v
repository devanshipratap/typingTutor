module random (
    input clk,
    input reset,
    output [3:0] num
    );

    reg [3:0] count <= 4'h0;

    always @ (posedge clk)
    begin
        if (count == 4'h9)
            count <= 4'h0
        else
            count <= count + 1;
    end

    assign num = count;

endmodule // random
