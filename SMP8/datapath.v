module datapath (input clk, reset,
input nop,
input load, store,
input mva, mvr,
input jump,
input [2:0] alucontrol,
output zero,
output [3:0] pc,
input [7:0] instr,
output [7:0] AC);

wire AC_clk;
wire [7:0] aluout;
assign AC_clk = ~nop & clk;
wire [3:0] pcnext, pcplus1;
wire [7:0] acnext, ldout, R, datamem; 
wire zeronext;

// next PC logic
flopr #(4) pcreg(clk, reset, pcnext, pc);
adder pcadd1 (pc, 4'h1, pcplus1);
mux2 #(4) pcmux(pcplus1, instr[3:0], jump, pcnext);
// register file logic
flopr #(8) AC_reg(AC_clk, reset, acnext, AC);
flopr #(8) R_reg (mva, reset, AC, R);
mux2 #(8) ldmux(aluout, datamem, load, ldout);
mux2 #(8) mvmux(ldout, R, mvr, acnext); 
dmem dmem (clk, instr[3:0], store, AC,datamem);
// ALU logic
alu alu(AC, R, alucontrol, aluout, zeronext);
flopr #(1) zeroreg(clk, reset, zeronext, zero);
endmodule

