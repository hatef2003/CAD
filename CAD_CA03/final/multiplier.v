`timescale 1ps/1ps
module eigth_bit_multiplier(input [7:0]a , b , output [7:0]res);
    wire [15:0] mult;
    assign mult = a *b;
    assign res = mult[15:8];
endmodule