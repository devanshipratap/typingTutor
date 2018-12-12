module fsm (
    output score_change,
    output score_reset,
    output store_val,
    input correct,
    input change
    );

    wire sInitial, sCorrect, sWrong, sReset;
    
    assign store_val = change;

endmodule // fsm
