module shared_memory;
endmodule

module system_controller;
endmodule

module data_xbar;
endmodule

module interconnect_switch;
    shared_memory SharedMem();
    system_controller SysController();
    data_xbar DataXbar();
endmodule

module top;
    interconnect_switch InterconnectSwitch();
endmodule
