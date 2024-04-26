module adr_gen_cnt(input clk , rst , ce , output reg [7:0]adr);
    reg [3:0] col_cnt ;
    always @(posedge clk)
    begin
        if(rst)
        begin
            col_cnt  <= 0 ; 
            adr <= 0 ;
        end
        else if (ce)
        begin
            if (col_cnt == 9 )
            begin
              adr <= adr + 4 ; 
              col_cnt <= 0 ; 
            end
            else 
            begin
              adr <= adr + 1 ; 
              col_cnt <= col_cnt + 1 ; 
            end
        end
    end
endmodule