// Include the top-level module
`include "GCD_top.sv"

module tb_top;
  logic clk;                   // Clock signal
  gcd_if f(clk);               // Interface instance with clock

  top uut(f, clk);             // Instantiate the top module with interface and clock

  // Clock generation: toggles every 5 time units
  initial clk = 0;
  always #5 clk = ~clk;

  // Stimulus block to apply inputs
  initial begin
    clk = 0;
    f.data_in = 0;
    f.start = 0;
    #5 f.start = 1;            // Start signal goes high
    #2 f.data_in = 143;        // First input (A)
    #10 f.data_in = 78;        // Second input (B)
    #200 $stop;                // Stop simulation after some delay
  end

  // Monitor block to display signal values during simulation
  initial begin
    $monitor($time, " clk=%b start=%b data_in=%0d result=%0d done=%b", 
             clk, f.start, f.data_in, f.result, f.done);
  end

  // Wait until the operation is done, then display the final result
  initial begin
    wait(f.done == 1);         // Wait for done signal
    #2;
    $display("Final GCD Result = %0d", f.result);  // Display result
    $stop;                     // Stop simulation
  end
endmodule
