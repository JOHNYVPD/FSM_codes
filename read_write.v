module read_write (clk,reset);
input clk ,reset;
parameter IDEL = 2'b00,WRITE =2'b01,READ = 2'b10,DONE =2'b11;
reg do_write,exec,rd_wr;
reg [1:0] state;


always @(posedge clk)
begin
if (~reset)
begin
state <= IDEL;
exec <=1'b0;
rd_wr <=rd_wr;
end
else

begin
case (state)

IDEL :begin 
if (do_write)
state <= WRITE;
else 
state <= READ;
//state <= do_write ? WRITE :READ;
end

WRITE : begin
//if (do_write)
//state <= DONE;
//else 
//state <= DONE;
state <= ~do_write ? DONE : WRITE;
exec <= 0;
rd_wr <=1;
end

READ : begin
state <= ~do_write ? DONE : READ;
exec <= 0;
rd_wr <=0;
end


DONE : begin
begin
if (do_write )
state <= IDEL;

else
state <= IDEL;
end
exec <= 1;
rd_wr<= rd_wr;
end

default :
state <= IDEL;
endcase
end
end
endmodule

