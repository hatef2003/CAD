module layer2_buf (input clk , we , input [1:0] i, j ,input [7:0] datain ,output  [127:0] data_out);
    reg [7:0] value[3:0][3:0];
    always @(posedge clk)
    begin
      if (we)
      begin
         value[i][j] <= datain;
      end
    end
    assign data_out  =  {value[ 0 ][0],value[ 0 ][0+1],value[ 0 ][0+2],value[ 0 ][0+3],
                         value[0+1][0],value[0+1][0+1],value[0+1][0+2],value[0+1][0+3],
                         value[0+2][0],value[0+2][0+1],value[0+2][0+2],value[0+2][0+3],
                         value[0+3][0],value[0+3][0+1],value[0+3][0+2],value[0+3][0+3] };
endmodule
