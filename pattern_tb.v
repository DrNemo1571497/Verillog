module tb;
reg x,RST, CLK;
wire y;
patt DUT(x, y, CLK, RST);

initial
begin
CLK = 1'b0;
//repeat (21)
end

initial
begin
$monitor($time,"x=%b,CLK=%b,RST=%b,y=%b",x,CLK,RST,y);
RST = 1;
x=0;
#10 RST =0;
#10 x = 0;
#10 x = 1;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 1;
#10 x = 1;
#10 x = 1;
#20;
$finish;

end

always #5 CLK = ~CLK;
endmodule

