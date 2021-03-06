module dmem (input clk,
input [3:0] a, 
input we,
input [7:0] wd,
output [7:0] rd);
reg [7:0] RAM[15:0];
initial
begin
$readmemh ("dmem.dat",RAM);
end
assign rd = RAM[a]; // word aligned
always @ (posedge clk)
if(we)
RAM[a] <= wd;
endmodule