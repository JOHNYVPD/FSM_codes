module counter (
    clk,
    out,
    rst_n,
    trigger
);


input wire clk; 
input wire rst_n;
input wire trigger;
    

output wire [3:0] out;

reg [3:0] counter;


always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        counter <= 4'b0000;
    end
    else begin
        if(trigger) begin
            if(counter>=4'b000 && counter < 4'b1010) begin
                counter <= counter + 4'b0001;
            end
            else begin
                counter <= 4'b0000;
            end
        end
        else begin
            if(counter>4'b000 && counter < 4'b1010) begin
                counter <= counter + 4'b0001;
            end
            else begin
                counter <= 4'b0000;
            end
        end
    end
end



assign out = (counter <= 4'b1010) ? counter : 4'b0000;







endmodule


