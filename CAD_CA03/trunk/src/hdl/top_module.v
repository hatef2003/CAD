module top_level(input clk , start_everything , input [7:0] x_val , y_val , z_val , output done);
    wire coj,coi,mac_done ,
                ld,addr_selc,rst,we,re,mem_init,mac_start,index_rst ,ien ,jen ,
                pic_shift,ans_shift,p4en,pf_selc ,shift_reg_write, filter_write,read_filter,pic_read , pic_write;
    wire  [7:0] a ,b;
    wire[1:0] i_filter , j_filter;
 control c( start_everything, clk , coj,coi,mac_done ,
                ld,addr_selc,rst,we,re,mem_init,mac_start,index_rst ,ien ,jen ,
                pic_shift ,ans_shift,shift_reg_write, filter_write,read_filter,pic_read , pic_write,
                a ,b, i_filter , j_filter ,p4en,pf_selc,done );
 data_path dp(    clk,ld,addr_selc,rst,we,re,x_y_select,mem_init,mac_start,index_rst ,ien ,jen ,
                        a,b,
                        i_filter , j_filter,
                        pic_shift,p4en,pf_selc,ans_shift ,shift_reg_write, filter_write,read_filter,pic_read , pic_write,
                        x_val,y_val,z_val , mac_done,coi,coj);
endmodule
