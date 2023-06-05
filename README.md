# RISCV-multi-cycle-processor
This is a multi-cycle processor designed according to the instruction set(assembly language) of RISC-V using the System Verilog HDL.
First of all, let us take a look at the code, and the schematics of the processor's different parts, and then you will see tests simulated and their results:
## The top module:
![The top module of RISC-V processor which contains a memory block, and the processor itself](/images/multi1.png)
This picture represents the top module of RISC-V processor which contains a memory block, and the processor itself and the picture belwo is SystemVerilog code for
this module:
![SystemVerilog code of top module](/images/top.png)
You can see the memory code in memory.sv file.
Now lets dive deeper and see the contents of the processor itself:
## The RISC-V processor module:
![The RISC-V processor module schematic](/images/multi3.png)
As you can see, it contains a Data path which should carry the data from memory to registers, from registers to ALU unit, or from registers to extend unit and etc.
And also this module contains a control unit, which interprets instructions and move on its state machine in order to valuate the control signals so that the Data path works correctly.
In oder words, control unit controls the data path.
![processor module code](/images/riscV_MultiCycle.png)
## The Data Path module:
![The Data Path module schematic](/images/multi4(datapath).png)
The Data path module contains register file, alu, extend unit, next pc register, old pc register, instruction register, data register, result multiplexer ..., all the components shown in the picture below which states an abstraction scheme of our multi-cycles RISCV processor:
![Abstraction image](images/extended/luiDataPath.png)
![Data Path code 1](images/datapath1.png)
![Data Path code 2](images/datapath2.png)
