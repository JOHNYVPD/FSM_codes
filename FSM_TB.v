`timescale 1ns/1ps
module FSM_TB ();
reg w,clk;
wire z;

FSM dut (w,z,clk);

initial 
begin
clk=0;w=0;

$monitor($time ,"clk=%b,w=%b",clk,w);
end

initial clk=1'b0;
always #5 clk=~clk;


initial
begin
#10 w=0;
#10 w=1;
#10 w=0;
#10 w=1;
#10 w=1;
#10 w=1;
#10 w=0;

#10 $finish; 
end    //end command
endmodule
