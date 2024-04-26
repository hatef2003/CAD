module layer2_filter_buf (input clk , we ,re, input [1:0 ] i,depth_index,input [31:0] datain ,output reg [511 :0] data_out);
    reg [7:0] val1[3:0][3:0];
    reg [7:0] val2[3:0][3:0];
    reg [7:0] val3[3:0][3:0];
    reg [7:0] val4[3:0][3:0];
    always @ (posedge clk) begin
        if(we)
        begin
            if (depth_index == 0) begin
            val1[i][0]<=datain[31:24] ;
            val1[i][1]<=   datain[23:16];
            val1[i][2]<= datain[15:8];
            val1[i][3]<=  datain[7:0] ; 
            end
            if (depth_index == 1) begin
            val2[i][0]<=datain[31:24] ;
            val2[i][1]<=   datain[23:16];
            val2[i][2]<= datain[15:8];
            val2[i][3]<=  datain[7:0] ; 
            end
            if (depth_index == 2) begin
            val3[i][0]<=datain[31:24] ;
            val3[i][1]<=   datain[23:16];
            val3[i][2]<= datain[15:8];
            val3[i][3]<=  datain[7:0] ; 
            end
            if (depth_index == 3) begin
            val4[i][0]<=datain[31:24] ;
            val4[i][1]<=   datain[23:16];
            val4[i][2]<= datain[15:8];
            val4[i][3]<=  datain[7:0] ; 
            end
        end
    end
    assign data_out = (re)?  {val1[ 0 ][0],val1[ 0 ][0+1],val1[ 0 ][0+2],val1[ 0 ][0+3],
                              val1[0+1][0],val1[0+1][0+1],val1[0+1][0+2],val1[0+1][0+3],
                              val1[0+2][0],val1[0+2][0+1],val1[0+2][0+2],val1[0+2][0+3],
                              val1[0+3][0],val1[0+3][0+1],val1[0+3][0+2],val1[0+3][0+3],
                              val2[ 0 ][0],val2[ 0 ][0+1],val2[ 0 ][0+2],val2[ 0 ][0+3],
                              val2[0+1][0],val2[0+1][0+1],val2[0+1][0+2],val2[0+1][0+3],
                              val2[0+2][0],val2[0+2][0+1],val2[0+2][0+2],val2[0+2][0+3],
                              val2[0+3][0],val2[0+3][0+1],val2[0+3][0+2],val2[0+3][0+3],
                              val3[ 0 ][0],val3[ 0 ][0+1],val3[ 0 ][0+2],val3[ 0 ][0+3],
                              val3[0+1][0],val3[0+1][0+1],val3[0+1][0+2],val3[0+1][0+3],
                              val3[0+2][0],val3[0+2][0+1],val3[0+2][0+2],val3[0+2][0+3],
                              val3[0+3][0],val3[0+3][0+1],val3[0+3][0+2],val3[0+3][0+3],
                              val4[ 0 ][0],val4[ 0 ][0+1],val4[ 0 ][0+2],val4[ 0 ][0+3],
                              val4[0+1][0],val4[0+1][0+1],val4[0+1][0+2],val4[0+1][0+3],
                              val4[0+2][0],val4[0+2][0+1],val4[0+2][0+2],val4[0+2][0+3],
                              val4[0+3][0],val4[0+3][0+1],val4[0+3][0+2],val4[0+3][0+3] }: 512'bz;
endmodule