module stimulus;

    reg clk;
    reg reset;
    wire[3:0] q;

    ripple_carry_counter r1(q, clk, reset);

    // Control clk signal that drives design block. Cycle time = 10
    initial
        clk = 1'b0; // set clk to 0
    always
        #5 clk = ~clk; // toggle clk every 5 time units

    // Control the reset signal that drive the design block.
    // Reset is asserted from 0 to 20 and from 200 to 220.
    initial
    begin
        $dumpfile("test.lxt");
        $dumpvars(0, stimulus);
        reset = 1'b1;
        #15 reset = 1'b0;
        #180 reset = 1'b1;
        #10 reset = 1'b0;
        #20 $finish; // terminate the simulation
    end

    // Monitor the outputs
    initial
        $monitor($time, " Output q = %d", q);

endmodule
