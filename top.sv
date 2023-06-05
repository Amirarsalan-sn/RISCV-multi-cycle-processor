
module top(input  logic        clk, reset, 
           output logic [31:0] WriteData, DataAdr, 
           output logic        MemWrite);

logic [31:0] ReadData;

riscV_MultiCycle rvMulti(clk, reset, ReadData, DataAdr, MemWrite, WriteData);
memory mem(clk, MemWrite, DataAdr, WriteData, ReadData);

 
endmodule
