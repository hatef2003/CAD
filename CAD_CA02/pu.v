module pu ( input clk, rst, 
            input [4:0] x1, x2, x3, x4, w1, w2, w3, w4, 
            output [4:0] out);

    wire [7:0] mult1, mult2, mult3, mult4; 
    wire [9:0] add1, add2, add3, add4;
    multiplier_4_x_4 m1(mult1, x1[3:0], w1[3:0]); 
    multiplier_4_x_4 m2(mult2, x2[3:0], w2[3:0]); 
    multiplier_4_x_4 m3(mult3, x3[3:0], w3[3:0]); 
    multiplier_4_x_4 m4(mult4, x4[3:0], w4[3:0]); 

    n_bit_reg mult_reg1 (clk , rst , pen_mult ,{{0, 0}, mult1}, add1);
    n_bit_reg mult_reg2 (clk , rst , pen_mult ,{{0, 0}, mult2}, add2);
    n_bit_reg mult_reg3 (clk , rst , pen_mult ,{{0, 0}, mult3}, add3);
    n_bit_reg mult_reg4 (clk , rst , pen_mult ,{{0, 0}, mult4}, add4);

    wire [10:0] add_out1, add_out2;
    wire [9:0] inverted;
    n_bit_inverter inv1(add2, inverted);
    wire[10:0] sum_inverted;
    CPS10 a1 (inverted, add1, add_out1);
    CPA10 a2 (0, add3, add4, add_out2);
    n_bit_inverter  #(11) inv2 (add_out2, sum_inverted);
    wire [11:0] result_cpa;
    CPS11 a3 (add_out1, sum_inverted, result_cpa);

    [11:0] result;
    n_bit_reg cpa_reg(clk, rst, pen_cpa, result_cpa, result)

    assign out = result[7:3];


endmodule