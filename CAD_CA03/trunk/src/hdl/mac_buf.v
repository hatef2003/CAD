module mac_buf(input clk ,we , input reg [127:0] pin ,input [3:0] i , j, output reg [7:0] res);
    reg [7:0] val [15:0];
    integer i1 ,j1;
    always @(posedge clk)
    begin
      if(we)
      begin
        val [0]<=pin[127:120];
        val [1]<=pin[119:112];
        val [2]<=pin[111:104];
        val [3]<=pin[103:96];
        val [5-1]<=pin[95:88];
        val [6-1]<=pin[87:80];
        val [7-1]<=pin[79:72];
        val [8-1]<=pin[71:64];
        val [9-1]<=pin[63:56];
        val [10-1]<=pin[55:48];
        val [11-1]<=pin[47:40];
        val [12-1]<=pin[39:32];
        val [13-1]<=pin[31:24];
        val [14-1]<=pin[23:16];
        val [15-1]<=pin[15:8];
        val [16-1]<=pin[7:0]; 
    end
    end
    assign res = val[i];
endmodule