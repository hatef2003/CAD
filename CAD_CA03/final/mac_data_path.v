module mac_data_path(input clk ,ld_buf, register_rst,register_ld,input [3:0] i , j , input [127 : 0] pic ,filter  , output [7:0] res);
    wire [7:0]  mult_out;
    wire [11:0] add_out,reg_out;
    wire [7:0 ]val1 , val2 ;
    mac_buf pic_buf( clk ,ld_buf , pic , i , j,  val1);
    mac_buf fil_buf( clk ,ld_buf , filter , i , j,  val2);

    eigth_bit_multiplier multiplier(val1 , val2, mult_out);
    eight_bit_adder adder(reg_out,{{4'd0},mult_out}, add_out);
    twelve_bit_register ac (clk , register_ld,register_rst, add_out , reg_out);
    assign res = reg_out[11:4]; 
endmodule