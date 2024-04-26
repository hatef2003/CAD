
module HowManyShift(input [23:0] num , output reg [4:0] out);
    always@(*)
    begin
        if(num[23])
            out=5'd0;
        else if(num[22])
            out=5'd1;
        else if(num[21])
            out=5'd2;
        else if(num[20])
            out=5'd3;
        else if(num[19])
            out=5'd4;
        else if(num[18])
            out=5'd5;
        else if(num[17])
            out=5'd6;
        else if(num[16])
            out=5'd7;
        else if(num[15])
            out=5'd8;
        else if(num[14])
            out=5'd9;
        else if(num[13])
            out=5'd10;
        else if(num[12])
            out=5'd11;
        else if(num[11])
            out=5'd12;
        else if(num[10])
            out=5'd13;
        else if(num[9])
            out=5'd14;
        else if(num[8])
            out=5'd15;
        else if(num[7])
            out=5'd16;
        else if(num[6])
            out=5'd17;
        else if(num[5])
            out=5'd18;
        else if(num[4])
            out=5'd19;
        else if(num[3])
            out=5'd20;
        else if(num[2])
            out=5'd21; 
        else if(num[1])
            out=5'd22;
        else if(num[0])
            out=5'd23;



    end



endmodule