module swap(clk, a, b);

output reg clk;
output reg a, b;
initial begin
clk = 1'b0;
a = 1'b0;
b = 1'b1;
$strobe($time, "Before swaping: A=%b, B=%b\n",a, b);
end
always @(posedge clk) begin

a <= b;
//end
//always @(posedge clk) begin

b <= a;
$strobe($time, "After swaping: A=%b, B=%b\n",a, b);
#100; 
$finish;
end
always #5 clk = ~clk;
endmodule 

