`timescale 1ns / 1ps

module tb_odd_up_down_counter;

    reg t_clk;
    reg t_rst; 
    reg t_Y;
    wire [3:0] t_count;

    odd_up_down_counter dut(.clk(t_clk), .reset(t_rst), .Y(t_Y), .count(t_count));

    initial begin 
        t_clk = 1'b0;
        forever #5 t_clk = ~t_clk;
    end

    initial begin 
        t_rst = 1'b1;
        #2 t_rst = 1'b0;
        #8 t_rst = 1'b1;

        #120 t_rst = 1'b0;
        #10 t_rst = 1'b1;
    end 

    initial begin
         t_Y = 1'b1;

         #80 t_Y = 1'b0;
    end

    initial begin
        $display("Program by Max Benedict Chavez, Odd Up-Down Counter test");
        $monitor("time=%0d, clk=%b, reset=%b, Y=%b, count=%b", 
                 $time, t_clk, t_rst, t_Y, t_count);
        $dumpfile("odd_counter.vcd");
        $dumpvars();
    end

    initial #180 $finish;


endmodule