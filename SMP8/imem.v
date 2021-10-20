module imem (input [3:0] a, output [7:0] rd);
reg [7:0] RAM[15:0]; // limited memory
initial
begin
$readmemh ("imem.dat",RAM);
end
assign rd = RAM[a]; // word aligned
endmodule
