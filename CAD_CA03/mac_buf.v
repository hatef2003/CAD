module mac_buf(input clk ,we , input reg [127:0] pin ,input [3:0] i , j, output reg [7:0] res);
    reg [7:0] val [15:0];
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
module mac_buf512(input clk ,we , input reg [511:0] pin ,input [7:0] i , j, output reg [7:0] res);
   reg [7:0] val [63:0];
 
    always @(posedge clk)
    begin
      if(we)
      begin
        val[0]<= pin[511:511-7];
        val[1]<= pin[503:503-7];
        val[2]<= pin[495:495-7];
        val[3]<= pin[487:487-7];
        val[4]<= pin[479:479-7];
        val[5]<= pin[471:471-7];
        val[6]<= pin[463:463-7];
        val[7]<= pin[455:455-7];
        val[8]<= pin[447:447-7];
        val[9]<= pin[439:439-7];
        val[10]<= pin[431:431-7];
        val[11]<= pin[423:423-7];
        val[12]<= pin[415:415-7];
        val[13]<= pin[407:407-7];
        val[14]<= pin[399:399-7];
        val[15]<= pin[391:391-7];
        val[16]<= pin[383:383-7];
        val[17]<= pin[375:375-7];
        val[18]<= pin[367:367-7];
        val[19]<= pin[359:359-7];
        val[20]<= pin[351:351-7];
        val[21]<= pin[343:343-7];
        val[22]<= pin[335:335-7];
        val[23]<= pin[327:327-7];
        val[24]<= pin[319:319-7];
        val[25]<= pin[311:311-7];
        val[26]<= pin[303:303-7];
        val[27]<= pin[295:295-7];
        val[28]<= pin[287:287-7];
        val[29]<= pin[279:279-7];
        val[30]<= pin[271:271-7];
        val[31]<= pin[263:263-7];
        val[32]<= pin[255:255-7];
        val[33]<= pin[247:247-7];
        val[34]<= pin[239:239-7];
        val[35]<= pin[231:231-7];
        val[36]<= pin[223:223-7];
        val[37]<= pin[215:215-7];
        val[38]<= pin[207:207-7];
        val[39]<= pin[199:199-7];
        val[40]<= pin[191:191-7];
        val[41]<= pin[183:183-7];
        val[42]<= pin[175:175-7];
        val[43]<= pin[167:167-7];
        val[44]<= pin[159:159-7];
        val[45]<= pin[151:151-7];
        val[46]<= pin[143:143-7];
        val[47]<= pin[135:135-7];
        val[48]<= pin[127:127-7];
        val[49]<= pin[119:119-7];
        val[50]<= pin[111:111-7];
        val[51]<= pin[103:103-7];
        val[52]<= pin[95:95-7];
        val[53]<= pin[87:87-7];
        val[54]<= pin[79:79-7];
        val[55]<= pin[71:71-7];
        val[56]<= pin[63:63-7];
        val[57]<= pin[55:55-7];
        val[58]<= pin[47:47-7];
        val[59]<= pin[39:39-7];
        val[60]<= pin[31:31-7];
        val[61]<= pin[23:23-7];
        val[62]<= pin[15:15-7];
        val[63]<= pin[7:7-7];
 
      end
    end
    assign res = val[i];

endmodule

