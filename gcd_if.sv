// Interface to connect datapath and controller for GCD calculation
interface gcd_if(input logic clk);

    // Control signals
    logic ldA, ldB;          // Load enables for registers A and B
    logic sel1, sel2;        // Select signals for multiplexers
    logic sel_in;            // Select between external input and result
    logic done;              // Indicates GCD operation is complete
    logic start;             // Start signal to begin operation

    // Status signals
    logic lt, gt, eq;        // Comparison results: less than, greater than, equal

    // Data signals
    logic [15:0] data_in;    // External input data
    logic [15:0] result;     // Final GCD result

endinterface
