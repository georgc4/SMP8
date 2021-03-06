module top (input clk, reset,output [6:0] PC, INSTRH, INSTRL, ACH, ACL);
wire [3:0] pc;
wire [7:0] AC, instr;

// instantiate processor and memories
smp8 smp8 (clk, ~reset, pc, instr, AC);
imem imem (pc[3:0],instr);
seven_seg_decoder_hex PC_DEC(pc, PC);
seven_seg_decoder_hex INSTRH_DEC(instr[7:4], INSTRH);
seven_seg_decoder_hex INSTRL_DEC(instr[3:0], INSTRL);
seven_seg_decoder_hex ACH_DEC(AC[7:4], ACH);
seven_seg_decoder_hex ACL_DEC(AC[3:0], ACL);
endmodule
