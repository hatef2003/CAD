module top_level#(parameter CONV_NUM = 4)(input clk , start_everything , input [7:0] x_val , y_val , z_val , output done,input [CONV_NUM * 10 -1  : 0] ofm_addr,output [CONV_NUM * 8 -1 : 0] ofm_out);
    wire coj,coi,mac_done ,
                ld,addr_selc,rst,we,re,mem_init,mac_start,index_rst ,ien ,jen ,
                pic_shift,ans_shift,p4en,pf_selc ,shift_reg_write,read_filter,pic_read , pic_write;
    wire  [7:0] a ,b;
    wire[1:0] i_filter1 ;
    wire [CONV_NUM-1: 0] filter_write;
 control #(CONV_NUM) c( start_everything, clk , coj,coi,mac_done ,
                ld,addr_selc,rst,we,re,mem_init,mac_start,index_rst ,ien ,jen ,
                pic_shift ,ans_shift,shift_reg_write,read_filter,pic_read , pic_write, filter_write,
                a ,b, i_filter1  ,p4en,pf_selc,done );
 data_path #(CONV_NUM) dp  (clk,done,ld,addr_selc,rst,we,re,x_y_select,mem_init,mac_start,index_rst ,ien ,jen ,
                        a,b,
                        ofm_addr,
                        i_filter1 ,
                        pic_shift,p4en,pf_selc,ans_shift ,shift_reg_write, filter_write,read_filter,pic_read , pic_write,
                        x_val,y_val,z_val , mac_done,coi,coj,
                        ofm_out
                        );
endmodule
