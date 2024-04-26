module  PE #(parameter NUM)( input clk ,mac_start, shift_reg_write,ans_shift,we ,mem_init,filter_write ,read_filter, input [1:0]i_filter,input [31:0]mem_out, input [7:0]write_addr,input done  , input [127:0] pic, output mac_done , output [31:0] mem_in  );
    wire [7:0 ] mac_result , mem_adr;
    wire [127:0] filter;
    mac Mac ( clk ,mac_start , mac_done , pic ,filter, mac_result);
    shift_reg ans_reg(clk ,shift_reg_write,ans_shift,mac_result,mem_in);
    filter_buf fb(clk , filter_write ,read_filter, i_filter,mem_out,filter);
    wire [31:0]foo;
    memory #( 43 ,  NUM) Mem  (clk,mem_adr,mem_in,we,re,mem_init,write_addr,done,foo);

endmodule
module data_path #(parameter CONV_NUM = 2)( input clk,done,ld,addr_selc,rst,we,re,x_y_select,mem_init,mac_start,index_rst ,ien ,jen ,
                    input [7:0] a ,b,
                    input [1:0] i_filter,
                    input pic_shift ,p4en,pf_selc, ans_shift ,shift_reg_write,input [CONV_NUM-1:0] filter_write,input read_filter,pic_read , pic_write,
                    input [7:0] x_val,y_val,z_val ,output mac_done,coi,coj);
    wire[31:0] mem_out,mem_in,mem_iniii;
    wire [7:0] mem_adr;
    wire [7:0] x_out  , y_out , z_out;
    wire [127:0] pic,filter;
    wire[7:0]mac_result;
    wire [1:0] iout ;
    wire useles;
    wire [3:0] jout,jwrite,pf_in;
    assign pf_in =(pf_selc)?jout:jwrite;
    assign mem_adr=(addr_selc)? y_out+a: x_out+a;
    memory #(140) Mem  (clk,mem_adr,mem_in,we,re,mem_init,z_out+b,done,mem_out);
    eight_bit_register x(clk , ld , rst , x_val , x_out);
    eight_bit_register y(clk , ld , rst , y_val , y_out);
    eight_bit_register z(clk , ld , rst , z_val , z_out);
    pic_buf    pb(clk ,  pic_write,pic_read,pic_shift,pf_in,iout,mem_out,pic);
    genvar k ;
    generate
    for (k = 0; k < CONV_NUM; k= k +1)
    begin : PE 
        
        PE #(k) pe ( clk ,mac_start, shift_reg_write,ans_shift,we,mem_init,filter_write[k] ,read_filter,i_filter ,mem_out, z_out+b,done, pic , mac_done ,mem_iniii);

    end 
    endgenerate
    // mac Mac ( clk ,mac_start , mac_done , pic ,filter, mac_result);
    // shift_reg ans_reg(clk ,shift_reg_write,ans_shift,mac_result,mem_in);
    two_bit_counter icounter(clk , index_rst , ien , iout , coi);
    four_bit_counte jcounter(clk , index_rst , jen , jout , coj);
    plus4_counter p4(clk , index_rst,p4en , jwrite,useles);

endmodule
