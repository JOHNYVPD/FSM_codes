
module FSM (w,z,clk,reset);
input w,clk,reset;
output z;
wire Q1;

D_flip f1 (w,Q1,clk,reset);

assign z=Q1&w;
endmodule

module D_flip (D,Q,clk,reset);
input D,clk,reset;
output reg Q;
always @ (negedge clk)
begin
if(reset)
Q<=0;
else
Q<=D;
end
endmodule