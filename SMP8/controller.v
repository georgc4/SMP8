module controller (input [3:0] op,
input zero,
output nop,
output load, store,
output mva, mvr,
output jump,
output [2:0] alucontrol);
reg [8:0] controls;
assign { nop, load, store, mva, mvr, jump, alucontrol }  = controls;
always@(*)
case(op) 
	4'h0: controls = 9'b100000100; //NOP
	4'h1: controls = 9'b010000100; //LDAC
	4'h2: controls = 9'b101000100; //STAC
	4'h3: controls = 9'b000100100; //MVAC
	4'h4: controls = 9'b000010000; //MOVR
	4'h5: controls = 9'b100001000; //JUMP
	4'h6: controls =   zero  ? 9'b100001000 : 9'b100000000; //JMPZ
	4'h7: controls = (~zero) ? 9'b100001000 : 9'b100000000; //JPNZ
	4'h8: controls = 9'b000000000; //ADD
	4'h9: controls = 9'b000000001; //SUB
	4'hA: controls = 9'b000000010; //INAC
	4'hB: controls = 9'b000000011; //CLAC
	4'hC: controls = 9'b000000100; //AND
	4'hD: controls = 9'b000000101; //OR
	4'hE: controls = 9'b000000110; //XOR
	4'hF: controls = 9'b000000111; //NOT
endcase
endmodule