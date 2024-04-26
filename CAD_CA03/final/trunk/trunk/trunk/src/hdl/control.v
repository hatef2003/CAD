
module control#(parameter NUMBER_OF_CONV=2)(input start_everything, clk , coj,coi,mac_done ,
               output reg ld,addr_selc,rst,we,re,mem_init,mac_start,index_rst ,ien ,jen ,
               pic_shift,ans_shift ,shift_reg_write,read_filter,pic_read , pic_write,
               output reg [NUMBER_OF_CONV - 1: 0 ]filter_write,
               output reg [7:0] a ,b,
               output reg [1:0] i_filter1 ,output reg p4en,pf_selc,output reg done);
parameter init =6'd0, idel = 6'd26,ldf1=6'd1, ldf2=6'd2, ldf3=6'd3, ldf4=6'd4, ldp1=6'd27, ldp2=6'd5, ldp3=6'd6, ldp4=6'd7, ldp5=6'd8, ldp6=6'd9, ldp7=6'd10,ldp8=6'd11,ldp9=6'd12,ldp10=6'd13,ldp11=6'd14,ldp12=6'd28,ldp13=6'd15,ldp14=6'd16,ldp15=6'd17,ldp16=6'd18,mac_Start=6'd19,mac_Done=6'd20,shift=6'd21,relode1=6'd22 , relode2=6'd23, relode3=6'd24,relode4=6'd25,write_memory=6'd29, last_write_memory=6'd30,DONE = 6'd31;
reg [1:0] shift_chek=2'd3 ;
reg[5:0] ps=init , ns;
reg [3:0] mac_num =0;
reg [1:0] load_filter_counter = 0 ;
reg [($clog2 (NUMBER_OF_CONV)-1):0] filter_counter ={($clog2 (NUMBER_OF_CONV)){1'b0}} ;
always @(*)
begin
// a=8'd0;
i_filter1 = 2'd0;
filter_write ={(NUMBER_OF_CONV){1'd0}}; 
{ld,addr_selc,rst,we,re,mem_init,mac_start,index_rst ,ien ,jen ,
pic_shift ,shift_reg_write,read_filter,pic_read , pic_write,p4en,pf_selc,ans_shift,done}=19'd0;
    case(ps)
        init:
        begin
          ns=(start_everything)?idel:init;
          mem_init = 1;
          ld=1;
          a = 8'd0;
          b=8'd0;

        end
        idel:
        begin
          index_rst = 1;
          ns=(~start_everything)?ldf1:idel;
        end
        ldf1:
        begin
          ns = (load_filter_counter == 3 && filter_counter == NUMBER_OF_CONV -1)? ldp1 :ldf1;
          addr_selc = 1;
          filter_write [filter_counter]= 1'b1;
          re=1; 
          i_filter1 = load_filter_counter;
          a=(filter_counter * 4) + load_filter_counter;
        end
        // ldf2:
        // begin
        //   ns= ldf3;
        //   addr_selc = 1;
        //   filter_write = 1;
        //   re=1;
        //   i_filter1 = 2'd1;
        //   a=8'd1;
        // end
        // ldf3:
        // begin
        //   ns=ldf4;
        //   addr_selc = 1;
        //   filter_write = 1;
        //   re=1;
        //   i_filter1 = 2'd2;
        //   a=8'd2;          
        // end
        // ldf4:
        // begin
        //   ns=ldp1;
        //   addr_selc = 1;
        //   filter_write = 1;
        //   re=1;
        //   i_filter1 = 2'd3;
        //   a=8'd3;
        // end
        ldp1:
        begin
          addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd0;
          p4en = 1;
          ns = ldp2;
        end
        ldp2:
        begin
          addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd1;
          p4en = 1;
          ns=ldp3;
        end
        ldp3:
        begin
          ns=ldp4;
          addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd2;
          p4en = 1;
          
        end
        ldp4:
        begin
          addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd3;
          ien = 1;
          p4en = 1;
          ns=ldp5;
        end
        ldp5:
        begin
          addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd4;
          p4en = 1;

          ns=ldp6;
        end
        ldp6:
        begin
            addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd5;
          p4en = 1;
          ns=ldp7;
        end
        ldp7:
        begin
            addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd6;
          p4en = 1;
          ns=ldp8;
        end
        ldp8:
        begin
          addr_selc = 0;
          re = 1;
          pic_write =1;
          ien = 1;
          a = 8'd7;
          p4en = 1;
          ns = ldp9;
        end
        ldp9:
        begin
          addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd8;
          p4en = 1;
          ns=ldp10;
        end
        ldp10:
        begin
        addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd9;
          p4en = 1;
          ns=ldp11;
        end
        ldp11:
        begin
        addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd10;
          p4en = 1;
          ns=ldp12;
        end
        ldp12:
        begin
          ien = 1;

        addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd11;
          p4en = 1;
          ns=ldp13;
        end
        ldp13:
        begin
        addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd12;
          p4en = 1;
          ns=ldp14;
        end
        ldp14:
        begin
        addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd13;
          p4en = 1;
          ns=ldp15;
        end
        ldp15:
        begin
        addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd14;
          p4en = 1;
          ns=ldp16;
        end
        ldp16:
        begin
        addr_selc = 0;
          re = 1;
          pic_write =1;
          a = 8'd15;
          p4en = 1;
          ns=mac_Start;
        end
        mac_Start:
        begin
          pf_selc = 1;
          pic_read =1;
          read_filter = 1;
          ns = (mac_done)?mac_Done:mac_Start;
          mac_start =1;
          if(mac_done)
          shift_reg_write = 1;
        end
        mac_Done:
        begin
          jen = 1;
          
          if (shift_chek == 2'd3)
          begin
            
            ns = write_memory;
          end
          else
            ns = shift; 
          
        end
        write_memory: 
        begin
          we=1;
          b = b+1;
          if (mac_num == 4'd13)
          begin
            pic_shift =1; 
            ns = relode1;
          end
          else
            ns = mac_Start;
        end
        shift:
        begin
          ans_shift =1 ; 
          if (mac_num == 4'd13 && a==63)
          begin 
            ns = last_write_memory ;
          end 
          else
          if (mac_num == 4'd13)
          begin
            pic_shift =1; 
            ns = relode1;
          end

          else
          ns = mac_Start;
        end
        relode1:
        begin
          p4en =1 ; 
          pic_write = 1;
          re= 1;
          ns = relode2;
        end
        relode2:
        begin
          p4en =1 ; 
          pic_write = 1;
          re= 1;
          ns = relode3;
        end
        relode3:
        begin
          p4en =1 ; 
          pic_write = 1;
          re= 1;
          ns = relode4;
        end
        relode4:
        begin
          p4en =1 ; 
          pic_write = 1;
          re= 1;
          ns = mac_Start;
        end
        last_write_memory:
        begin
        we =1 ;
        ns = DONE;
        end
        DONE:
        begin
        done = 1 ;
        end
        default : begin
          ns = init;
        end
    endcase
end




always @(posedge clk )
  begin
    if (ns == mac_Done)begin
      shift_chek <= shift_chek +2'd1;
      mac_num<=mac_num+4'd1;
    end
    if (ns == relode1)
    begin
      a<= a+1;
      mac_num<=0;
    end
    if(ns == relode2 || ns == relode3 || ns == relode4)
    begin
      a<=a+1; 
    end
    if (ns == last_write_memory)
      b<=b+1; 
    if (ps == ldf1)
      begin
        load_filter_counter <= load_filter_counter+1 ; 
      end
    if (ps == ldf1  && load_filter_counter == 3 )
    begin
      filter_counter<=filter_counter+1;
    end
    
    ps<=ns;
    end
endmodule
