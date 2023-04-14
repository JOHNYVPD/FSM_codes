module new_fsm (in,out,reset,clk);
input in,reset,clk;
output reg out;
parameter s0=2'b00, s1=2'b01,s2=2'b10;
reg [2:0] state,ns;
always @ ( negedge clk or negedge reset)
begin
if(reset==0)
state <= s0;
else
state <=ns;
end
always @ (state,in)


case(state)

s0 : begin

if (in ==1)
ns <= s1;
else
ns <=s0;
end

s1 : begin

if (in ==1)
ns <= s2;
else
ns <=s0;
end

s2 : begin

if (in ==1)
ns <= s2;
else
ns <=s0;
end

default : ns <= s0;
endcase

always @ (state)
begin
case (state)
s0 : out <=0;
s1 : out <=0;
s2 : out <=1;
default : out <=0;
endcase
end
endmodule
