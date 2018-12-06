module timer (
    input clk,
    input reset,
    input enable,
    input [3:0] currTimeLimit,
    output [3:0] newTime
    );

    wire [3:0] clockCounter;
    wire [3:0] currTime;

    always @ (posedge clk)
    begin
        if (reset == 1'b1)
            begin
                currTime = 0;
                clockCounter = 0;
            end
        else if (clockCounter == 50000000)
            begin
                currTime += 1;
                clockCounter = 1;
            end
        else
            begin
                clockCounter += 1;
            end
    end

    assign newTime = currTimeLimit - currTime;

endmodule // timer
