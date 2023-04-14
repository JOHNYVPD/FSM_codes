module count (Q,clk,res_n,t);
input clk,res_n;
output [3:0]Q;
input t;
reg [3:0]w; 

always @ (posedge clk or negedge res_n)
begin
if (res_n == 0)
w<= 4'b0000;
else
case(t)

1'b1:
begin
if(w>=4'b0000 && w<=4'b1010 )
w<=w+4'b0001;
else
w <= 4'b0000;
end
 
1'b0:
begin
if(w>4'b0000 && w<4'b1010 )
w<=w+4'b0001;
else
w <= 4'b0000;
end
default : w<=4'b0000;
endcase
end
assign Q =w;

endmodule

