module Comparator(input [3:0] v,output [3:0] z);
        assign z = (v[1] & ~v[2] & v[3]) | (v[2] & v[3]);
endmodule


module CircuitA(input [2:0] v, output [3:0] m);

        assign m[0] = v[0];
        assign m[1] = ~v[1] & v[2] & 1;
        assign m[2] = v[1] & v[2] & 1;
        assign m[3] = 0;
endmodule


module DecimalDigitDecoder(input [3:0] v, output [3:0] z, output [3:0] m);
        Comparator comp(v[3:0], z);
        wire [3:0] w;
        CircuitA cA(v[2:0], w);
        mux2v #(4) mx( m,  v,  w,  z);
endmodule
