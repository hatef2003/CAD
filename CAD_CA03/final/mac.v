module mac (input clk ,start , output done ,input [127 : 0] pic ,filter, output [7:0] res);
    wire [4:0] i ,j ;    
    wire  register_rst,register_ld,ld_buf;
    mac_data_path dp (clk ,ld_buf,register_rst,register_ld, i[4:1], j[4:1] , pic ,filter  , res);
    mac_controller c (clk , start , i , j , done, ld_buf , register_rst , register_ld);
endmodule