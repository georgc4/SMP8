module smp8 (input clk, reset,
output [3:0] pc,
input [7:0] instr,
output [7:0] AC);
wire zero, nop, load, store, mva, mvr, jump;
wire [2:0] alucontrol;
controller c(instr[7:4], zero, nop, load, store, mva, mvr, jump, alucontrol);
datapath dp(clk, reset, nop, load, store, mva, mvr, jump, alucontrol, zero, pc, instr, AC);
endmodule