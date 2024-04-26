module nine_bit_wierd_counter(input clk,rst , en ,ld , input [8:0] ld_value , output reg co ,output reg [8:0] out_val);
reg [1:0 ]two_bit_cnt , another_two_bit_cnt; 
 always @(posedge clk )begin
    co = 0 ; 
    if (rst)begin
        out_val<= 9'd0;
        two_bit_cnt <= 0 ; 
        another_two_bit_cnt <= 0 ;
        end
    if (ld)
    begin
        two_bit_cnt <= 0 ;
        out_val <= ld_value;
        another_two_bit_cnt <= 0 ;
    end
    if (another_two_bit_cnt == 3 && two_bit_cnt == 3 )
    begin
      co = 1 ;
    end
    else if (en)
    begin
        if(two_bit_cnt == 3)
        begin
          out_val <= out_val +10 ; 
          two_bit_cnt <= 0 ;
          another_two_bit_cnt <= another_two_bit_cnt+1 ;
        end
        else 
        begin
            out_val <= out_val +1 ; 
            two_bit_cnt <= two_bit_cnt +1 ;  
        end
    end
end
endmodule