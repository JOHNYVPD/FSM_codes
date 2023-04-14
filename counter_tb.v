`timescale 1ns/1ps
module counter_tb ();


reg clk;

reg rst_n;

wire [3:0] out;

reg trigger;



counter counter_inst_1(
    .clk(clk),
    .rst_n(rst_n),
    .trigger(trigger),
    .out(out)
);


initial begin

    //0.0ns


    clk         = 1'b0;
    rst_n       = 1'b1;
    trigger     = 1'b0;

    repeat (1) @(posedge clk);

    rst_n       = 1'b0;

    repeat (1) @(posedge clk);

    rst_n       = 1'b1;

    repeat (1) @(posedge clk);


    trigger     = 1'b1;

    repeat (1) @(posedge clk);

    trigger     = 1'b0;

    repeat (5) @(posedge clk);


    trigger     = 1'b1;

    repeat (1) @(posedge clk);

    trigger     = 1'b0;

    repeat (15) @(posedge clk);

    $finish;


end


initial forever begin
    #5 clk =~ clk;
end
















    
endmodule
