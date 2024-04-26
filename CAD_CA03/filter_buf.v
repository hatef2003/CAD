module filter_buf(input clk , we ,re, input [1:0 ] i ,input [31:0] datain ,output reg [127 :0] data_out);
    reg [7:0] val[3:0][3:0];
    always @ (posedge clk) begin
        if(we)
        begin
            val[i][0]<=datain[31:24] ;
            val[i][1]<=   datain[23:16];
            val[i][2]<= datain[15:8];
            val[i][3]<=  datain[7:0] ; 
        end
    end
    assign data_out = (re)? {val[ 0 ][0],val[ 0 ][0+1],val[ 0 ][0+2],val[ 0 ][0+3],
                              val[0+1][0],val[0+1][0+1],val[0+1][0+2],val[0+1][0+3],
                              val[0+2][0],val[0+2][0+1],val[0+2][0+2],val[0+2][0+3],
                              val[0+3][0],val[0+3][0+1],val[0+3][0+2],val[0+3][0+3] }: 128'bz;
endmodule