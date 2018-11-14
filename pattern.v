//Verilog code to detect 1101 pattern

module patt(x,y,CLK,RST);  
input x,CLK,RST;  
output y;  
reg y;  
reg [1:0] Prstate, Nxtstate;  
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;   

always @ (posedge CLK or posedge RST)      
if (RST) 
Prstate <= S0;    
else 
Prstate <= Nxtstate;  
  
always @ (*)     
    case (Prstate)            						
	  S0: if (x == 1'b1) Nxtstate = S1; else Nxtstate=S0;            
	  S1: if (x == 1'b1) Nxtstate = S2; else Nxtstate=S0;            
 	  S2: if (x == 1'b0) Nxtstate = S3; else Nxtstate=S2;            
	  S3: if (x == 1'b1) Nxtstate = S1; else Nxtstate=S0;           
	endcase   

always @ (*)          
	  if (Prstate == S3 && x == 1) y = 1; 
	  else y = 0;  
//assign y = (Nxtstate == S3) && (x==1'b1);

      
endmodule	

