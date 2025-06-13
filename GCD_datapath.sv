// Include the interface definition
`include "gcd_if.sv"

// Datapath module for GCD calculation
module GCD_datapath (gcd_if f);

  // Internal wires for intermediate data
  wire [15:0] Aout, Bout, X, Y, Bus, SubOut;

  // Two parallel-in parallel-out registers (PIPO)
  PIPO A (Aout, Bus, f.ldA, f.clk);   // Register A
  PIPO B (Bout, Bus, f.ldB, f.clk);   // Register B

  // Multiplexers to select values for subtraction
  MUX M1 (X, Aout, Bout, f.sel1);     // Select input X: Aout or Bout
  MUX M2 (Y, Aout, Bout, f.sel2);     // Select input Y: Aout or Bout

  // MUX to select between subtraction result and external input
  MUX M3 (Bus, SubOut, f.data_in, f.sel_in); 

  // Subtractor module: performs X - Y
  SUB SB (SubOut, X, Y);

  // Comparator module: compares Aout and Bout
  COMPARE CMP (f.lt, f.gt, f.eq, Aout, Bout);

  // Assign final result to output
  assign f.result = Aout;

endmodule

// Parallel-In Parallel-Out (PIPO) Register
module PIPO (
  output logic [15:0] data_out, 
  input  logic [15:0] data_in, 
  input  logic load, clk
);
  // On rising clock edge, load data if enabled
  always_ff @(posedge clk)
    if (load) data_out <= data_in;
endmodule

// 2-to-1 Multiplexer
module MUX (
  output logic [15:0] out, 
  input  logic [15:0] in0, in1, 
  input  logic sel
);
  // Output selected input based on sel
  assign out = sel ? in1 : in0;
endmodule

// Subtractor module
module SUB (
  output logic [15:0] out, 
  input  logic [15:0] in1, in2
);
  // Perform subtraction
  assign out = in1 - in2;
endmodule

// Comparator module
module COMPARE (
  output logic lt, gt, eq, 
  input  logic [15:0] data1, data2
);
  // Compare inputs and set appropriate flags
  assign lt = (data1 < data2);
  assign gt = (data1 > data2);
  assign eq = (data1 == data2);
endmodule
