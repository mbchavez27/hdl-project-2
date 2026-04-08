// Name: Max Benedict Chavez, Section: S03
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
        t_rst = 1'b0;

        t_Y = 1'b0;

        #10 t_rst = 1'b1;

        #90;

        t_Y = 1'b1;
        #90;

        $finish;

    end 

    initial begin
        $display("Name: Max Benedict Chavez");
        $display("Specification: Behavioral odd up-down Binary counter");

        $monitor("time=%0d, clk=%b, reset=%b, Y=%b, count=%b", 
                 $time, t_clk, t_rst, t_Y, t_count);
        
        $dumpfile("odd_counter.vcd");
        $dumpvars();
    end

endmodule