`timescale 1ns / 1ps

module tb_odd_up_down_counter;

    reg clk;
    reg reset;
    reg Y;
    wire [3:0] count;

    odd_up_down_counter uut (
        .clk(clk),
        .reset(reset),
        .Y(Y),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        Y = 1;

        $display("Applying Reset...");
        reset = 0;
        #10;
        reset = 1; 
        
        $display("Testing Upstream (Y = 1)...");
        #80; 

        $display("Testing Downstream (Y = 0)...");
        Y = 0;
        #80; 

        $display("Testing Reset interruption...");
        #12 reset = 0; 
        #10 reset = 1;

        #30 $finish;
    end

    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | Y=%b | count=%b", $time, clk, reset, Y, count);
    end

endmodule