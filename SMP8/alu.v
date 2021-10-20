module alu (a,b,sel, out, zero);
    
input [7:0] a,b;
input [2:0] sel; 
output reg [7:0] out;
output reg zero;

  initial
  begin
  out = 0;
  zero =1'b0;
  end
    always @ (*) 
    begin 
        case(sel) 
    3'b000: 
	begin
		out=a + b; 
		zero = (out ==0);
    end                   
    3'b001:
	begin
		out= a - b; 
		zero = (out ==0); 
	end		
	 3'b010:
	begin
		out= a + 1; 
		zero = (out ==0); 
	end
	 3'b011:
	begin
		out= 0; 
		zero = 1; 
	end	
	 3'b100:
	begin
		out= a & b; 
		zero = (out ==0); 
	end		
	 3'b101:
	begin
		out= a | b; 
		zero = (out ==0); 
	end	
    3'b110: 
	begin
		out=a ^ b;  
		zero = (out ==0);
    end              
    3'b111: 
	begin
		out= ~a;  
		zero = (out ==0);
    end         
	default: begin
			out = 8'h00;
			zero = 1'b1;
			end
        endcase
    end
endmodule