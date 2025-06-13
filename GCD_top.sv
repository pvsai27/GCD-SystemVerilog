// Include necessary module and interface definitions
`include "GCD_datapath.sv"
`include "controller.sv"
`include "gcd_if.sv"

// Top-level module that connects datapath and controller using the interface
module top(gcd_if f, input logic clk);
   
    // Connect external clock to the interface
    assign f.clk = clk;

    // Instantiate the GCD datapath module
    GCD_datapath dp(f);

    // Instantiate the controller module
    controller ctrl(f);
endmodule
