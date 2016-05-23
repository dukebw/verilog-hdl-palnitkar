module ripple_carry_counter(q, clk, reset);

    output [3:0] q;
    input clk;
    input reset;

    T_FF tff0(q[0], clk, reset);
    T_FF tff1(q[1], q[0], reset);
    T_FF tff2(q[2], q[1], reset);
    T_FF tff3(q[3], q[2], reset);

endmodule

module T_FF(q, clk, reset);

    output q;
    input clk;
    input reset;
    wire d;

    D_FF dff0(q, d, clk, reset);
    not n1(d, q);

endmodule

// module D_FF with synchronous reset
module D_FF(q, d, clk, reset);

    output q;
    input d;
    input clk;
    input reset;
    reg q;

    always @(posedge reset or negedge clk)
        if (reset)
            q <= 1'b0;
        else
            q <= d;

endmodule
