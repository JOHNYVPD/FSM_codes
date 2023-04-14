module vend (in,clk,out,res,change);
input [1:0]in; //01=10tk,10=50tk,11=60tk
input clk;
input res;
output reg  out;
output reg [1:0] change; // 01= 10tk , 10= 20tk


parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;  // s0=reset or ideal,s1=10tk st,s2=50tk st,s3=60tk st

reg [1:0]ps,ns;

always @ (posedge clk)
begin

if (res ==1)
begin
ps <=0;
ns <= 0;
end
else
begin
ps<=ns;
case (ps)

s0: if (in == 2'b00)
begin
ns<=s0;
out <=0;
change<=2'b00;
end
else if (in == 2'b01)
begin
ns<=s1;
out <=0;
change <=2'b00;
end
else if (in == 2'b10)
begin
ns<=s2;
out <=1;
change<=2'b01;
end
else
begin 
if (in == 2'b11)
begin
ns<=s3;
out <=1;
change <=2'b10;
end
end


s1: if (in == 2'b00)
begin
ns<=s0;
out <=0;
change<=2'b01;
end
else if (in == 2'b01)
begin
ns<=s2;
out <=0;
change <=2'b00;
end
else 
begin
if (in == 2'b10)
begin
ns<=s0;
out <=1;
change<=2'b10;
end
end


s2: if (in == 2'b00)
begin
ns<=s0;
out <=1;
change<=2'b01;
end
else 
begin
if (in == 2'b01)
begin
ns<=s0;
out <=1;
change <=2'b10;
end
end

s3: if (in == 2'b00)
begin
ns<=s0;
out <=1;
change<=2'b10;
end
else 
begin
ns<=s0;
out <=0;
end
default : 
begin
ns<=s0;
out<=0;
change <=2'b00;
end
endcase
end
end

endmodule
