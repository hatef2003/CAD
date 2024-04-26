module pic_buf(input clk , we ,re,shift, input [3:0] j , input [1:0] i ,input [31:0] datain ,output reg [127:0] data_out);
    reg [7:0] val[3:0][15:0];
    integer k ;
    integer y ;
    always @(posedge clk)
    begin
        if(shift)
         begin
          for (k =0; k<3; k=k+1)
             for (y=0;y<16;y=y+1)
             begin 
               val [k][y]=val[k+1][y];
             end
           for(y = 0 ; y < 16; y=y+1)
           begin
             val[3][y]=8'bx;
            end
        end
        if(we)
        begin
          val[i][ j ] = datain[ 7:0 ];
          val[i][j+1] = datain[ 15:8];
          val[i][j+2] = datain[23:16];
          val[i][j+3] = datain[31:24];
        end
    end
     assign data_out = (re)? {
                              val[0][j-3],val[0][j-2],val[0][j-1],val[0][j],
                              val[1][j-3],val[1][j-2],val[1][j-1],val[1][j],
                              val[2][j-3],val[2][j-2],val[2][j-1],val[2][j],
                              val[3][j-3],val[3][j-2],val[3][j-1],val[3][j]
                              } :128'bz;  
endmodule
