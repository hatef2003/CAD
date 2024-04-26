module FloatMultiplier(input[31:0] a, b , output[31:0] result);
    reg sign;
    assign sign = a[31]^b[31];
    reg [7:0] exponent;
    reg [7:0] temp1;
    assign temp1 =(a[30:23]-8'd127)+(b[30:23]-8'd127)+8'd127;
    //ther hardest part
    reg [22:0] mantisa;
    reg [47:0] temp; 
    assign temp = {1'b1,a[22:0]}*{1'b1,b[22:0]};
    reg [1:0] int_part;
    assign int_part = temp[47:46];
    assign mantisa = (int_part==2'b01)?temp[45:23]
            :((int_part==2'b11)|(int_part==2'b10))?temp[46:24]
            :22'bz;
    assign exponent = ((int_part==2'b11)|(int_part==2'b10))?(temp1+8'd1):temp1;
    assign result=(a==32'd0 | b== 32'd0 )?32'd0:{sign,exponent,mantisa};

endmodule
