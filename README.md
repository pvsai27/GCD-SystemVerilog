# GCD-SystemVerilog
A GCD module implemented using SystemVerilog interfaces and top module structure.
# GCD-SystemVerilog

This project implements the **Greatest Common Divisor (GCD)** computation using **SystemVerilog**, utilizing a modular architecture with `interface`, datapath, controller, and top module structure.

---

## 📁 Project Structure

GCD-SystemVerilog/
├── gcd_if.sv # Interface definition for datapath and controller communication
├── GCD_datapath.sv # Datapath module implementing registers, muxes, comparator, subtractor
├── controller.sv # FSM-based controller to drive datapath control signals
├── GCD_top.sv # Top module instantiating datapath and controller
├── GCD_tb.sv # Testbench to simulate GCD operation

yaml
Copy
Edit

---

## ⚙️ Features

- Modular design using **SystemVerilog interface**
- FSM-based control logic
- PIPO registers, MUXes, SUB, and COMPARE components
- Synthesizable architecture
- Monitor and display of simulation results via testbench

---

## 🧪 How to Simulate (ModelSim / QuestaSim)

1. Open ModelSim
2. Compile all the files:
   ```tcl
   vlog gcd_if.sv GCD_datapath.sv controller.sv GCD_top.sv GCD_tb.sv
Simulate the testbench:

tcl
Copy
Edit
vsim tb_top
run -all
View waveform or monitor output in terminal.

🖥️ Sample Output (Console)
sql
Copy
Edit
  0 clk=0 start=0 data_in=0 result=x done=x
#                    5 clk=1 start=1 data_in=0 result=x done=0
#                    7 clk=1 start=1 data_in=143 result=x done=0
#                   10 clk=0 start=1 data_in=143 result=x done=0
#                   15 clk=1 start=1 data_in=143 result=143 done=0
#                   17 clk=1 start=1 data_in=78 result=143 done=0
#                   20 clk=0 start=1 data_in=78 result=143 done=0
#                   25 clk=1 start=1 data_in=78 result=143 done=0
#                   30 clk=0 start=1 data_in=78 result=143 done=0
#                   35 clk=1 start=1 data_in=78 result=65 done=0
#                   40 clk=0 start=1 data_in=78 result=65 done=0
#                   45 clk=1 start=1 data_in=78 result=65 done=0
#                   50 clk=0 start=1 data_in=78 result=65 done=0
#                   55 clk=1 start=1 data_in=78 result=52 done=0
#                   60 clk=0 start=1 data_in=78 result=52 done=0
#                   65 clk=1 start=1 data_in=78 result=39 done=0
#                   70 clk=0 start=1 data_in=78 result=39 done=0
#                   75 clk=1 start=1 data_in=78 result=26 done=0
#                   80 clk=0 start=1 data_in=78 result=26 done=0
#                   85 clk=1 start=1 data_in=78 result=13 done=0
#                   90 clk=0 start=1 data_in=78 result=13 done=0
#                   95 clk=1 start=1 data_in=78 result=0 done=1
🙋 Author
P.VenkataSai
4th Year ECE Student | VLSI & RTL Enthusiast
LinkedIn: [https://www.linkedin.com/in/venkatasai7/]
GitHub: https://github.com/pvsai27

📌 License
This project is open-source under the MIT License.

yaml
Copy
Edit

---

### ✅ To Use:
1. Copy the above code into a file named `README.md`
2. Place it in your GitHub repo root directory
3. GitHub will automatically render it
