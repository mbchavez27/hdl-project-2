`timescale 1ns / 1ps

module odd_up_down_counter (
    input wire clk, 
    input wire reset, 
    input wire Y, 
    output reg [3:0] count
); 

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            count <= 4'b0001;
        end else begin 
            if (Y == 1'b1) begin
                case (count)
                    4'b0001: count <= 4'b0011;
                    4'b0011: count <= 4'b0101;
                    4'b0101: count <= 4'b0111;
                    4'b0111: count <= 4'b1001;
                    4'b1001: count <= 4'b1011;
                    4'b1011: count <= 4'b1101;
                    4'b1101: count <= 4'b1111;
                    4'b1111: count <= 4'b0001;
                    default: count <= 4'b0001;
                endcase
            end else begin
                case (count)
                    4'b0001: count <= 4'b1111;
                    4'b0011: count <= 4'b0001;
                    4'b0101: count <= 4'b0011;
                    4'b0111: count <= 4'b0101;
                    4'b1001: count <= 4'b0111;
                    4'b1011: count <= 4'b1001;
                    4'b1101: count <= 4'b1011;
                    4'b1111: count <= 4'b1101;
                    default: count <= 4'b0001; 
                endcase 
            end 
        end 
    end 
endmodule 