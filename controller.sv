// Include the interface definition
`include "gcd_if.sv"

// Controller module for GCD operation
module controller (gcd_if f);

  // Define state types for FSM (Finite State Machine)
  typedef enum logic [2:0] {S0, S1, S2, S3, S4, S5} state_t;
  state_t state;

  // State transition logic (sequential logic)
  always @(posedge f.clk) begin
    case (state)
      S0: if (f.start) state <= S1;      // Wait for start signal
      S1: state <= S2;                   // Move to comparison stage
      S2: if (f.eq) state <= S5;         // If equal, GCD found
          else if (f.lt) state <= S3;    // If A < B, go to subtract B
          else if (f.gt) state <= S4;    // If A > B, go to subtract A
      S3: if (f.eq) state <= S5;         // Repeat check
          else if (f.lt) state <= S3;
          else if (f.gt) state <= S4;
      S4: if (f.eq) state <= S5;
          else if (f.lt) state <= S3;
          else if (f.gt) state <= S4;
      S5: state <= S5;                   // Remain in final state
      default: state <= S0;             // Default to initial state
    endcase
  end

  // Output control logic (combinational logic)
  always @(state) begin
    // Default signal values
    f.ldA = 0; f.ldB = 0;
    f.sel1 = 0; f.sel2 = 0;
    f.sel_in = 0; f.done = 0;

    case (state)
      S0: begin
        f.sel_in = 1;  // Load first input to A
        f.ldA = 1;
      end
      S1: begin
        f.sel_in = 1;  // Load second input to B
        f.ldB = 1;
      end
      S2, S3, S4: begin
        if (f.eq)
          f.done = 1;  // If equal, GCD found
        else if (f.lt) begin
          f.sel1 = 1; f.sel2 = 0; f.sel_in = 0; f.ldB = 1; // B = B - A
        end else if (f.gt) begin
          f.sel1 = 0; f.sel2 = 1; f.sel_in = 0; f.ldA = 1; // A = A - B
        end
      end
      S5: f.done = 1;  // Signal done
    endcase
  end
endmodule
