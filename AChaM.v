`timescale 1ns / 1ps

module odd_up_down_counter (
    input wire clk,
    input wire reset,
    input wire Y,
    output reg [3:0] count
);

    parameter S1  = 4'b0001,
              S3  = 4'b0011,
              S5  = 4'b0101,
              S7  = 4'b0111,
              S9  = 4'b1001,
              S11 = 4'b1011,
              S13 = 4'b1101,
              S15 = 4'b1111;

    reg [3:0] current_state, next_state;

    always @(posedge clk or negedge reset) begin
        if (~reset) begin
            current_state <= S1; 
        end else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case (current_state)
            S1:  next_state = Y ? S3  : S15;
            S3:  next_state = Y ? S5  : S1;
            S5:  next_state = Y ? S7  : S3;
            S7:  next_state = Y ? S9  : S5;
            S9:  next_state = Y ? S11 : S7;
            S11: next_state = Y ? S13 : S9;
            S13: next_state = Y ? S15 : S11;
            S15: next_state = Y ? S1  : S13;
            default: next_state = S1; 
        endcase
    end

    always @(*) begin
        count = current_state;
    end

endmodule