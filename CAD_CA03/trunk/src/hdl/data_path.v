module data_path(   input clk,ld,addr_selc,rst,we,re,x_y_select,mem_init,mac_start,index_rst ,ien ,jen ,
                    input [7:0] a ,b,
                    input [1:0] i_filter , j_filter,
                    input pic_shift ,p4en,pf_selc, ans_shift ,shift_reg_write, filter_write,read_filter,pic_read , pic_write,
                    input [7:0] x_val,y_val,z_val ,output mac_done,coi,coj);
    wire[31:0] mem_out,mem_in;
    wire [7:0] mem_adr;
    wire [7:0] x_out  , y_out , z_out;
    wire [127:0] pic,filter;
    wire[7:0]mac_result;
    wire [1:0] iout ;
    wire useles;
    wire [3:0] jout,jwrite,pf_in;
    assign pf_in =(pf_selc)?jout:jwrite;
    assign mem_adr=(addr_selc)? y_out+a: x_out+a;
    memory Mem (clk,mem_adr,mem_in,we,re,mem_init,z_out+b,mem_out);
    eight_bit_register x(clk , ld , rst , x_val , x_out);
    eight_bit_register y(clk , ld , rst , y_val , y_out);
    eight_bit_register z(clk , ld , rst , z_val , z_out);
    filter_buf fb(clk , filter_write ,read_filter, i_filter, j_filter,mem_out,filter);
    pic_buf    pb(clk ,  pic_write,pic_read,pic_shift,pf_in,iout,mem_out,pic);
    mac Mac ( clk ,mac_start , mac_done , pic ,filter, mac_result);
    two_bit_counter icounter(clk , index_rst , ien , iout , coi);
    shift_reg ans_reg(clk ,shift_reg_write,ans_shift,mac_result,mem_in);
    four_bit_counte jcounter(clk , index_rst , jen , jout , coj);
    plus4_counter p4(clk , index_rst,p4en , jwrite,useles);

endmodule
