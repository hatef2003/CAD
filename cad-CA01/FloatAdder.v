module FloatAdder(input[31:0] a, b , output reg [31:0] result);
    reg [8:0] NumberOfShift ;
    reg [8:0] MinestNumberOfShift ;
    reg sign;
    reg [7:0] temp;
    reg [7:0] exp;
    reg [22:0] mantisa;
    reg [24:0] add_result;
    reg [24:0] sub_result;
    reg [24:0] minest_sub;
    reg [24:0] temp_sub;
    wire [4:0] bulshit;

    HowManyShift hm2(minest_sub[23:0],bulshit);
    always @(*) begin
        NumberOfShift ={1'b0,a[30:23]}-{1'b0,b[30:23]};
        MinestNumberOfShift= -NumberOfShift;
        if  (a[31]==b[31])
        begin
            if(NumberOfShift[8])
            begin 
                temp=MinestNumberOfShift[7:0];
                add_result =( {2'b01,b[22:0]})+({1'b0,({1'b1,a[22:0]}>>temp)});
                mantisa=((add_result[24:23]==2'd2)|(add_result[24:23]==2'd3))?add_result[23:1]:add_result[22:0];
                exp = ((add_result[24:23]==2'd2)|(add_result[24:23]==2'd3))? (b[30:23]+8'd1):b[30:23];
            end
            else
            begin
                temp= NumberOfShift[7:0];
                add_result = {2'b01,a[22:0]}+{1'b0,({1'b1,b[22:0]}>>temp)};
                mantisa=((add_result[24:23]==2'd2)|(add_result[24:23]==2'd3))?add_result[23:1]:add_result[22:0];
                exp = ((add_result[24:23]==2'd2)|(add_result[24:23]==2'd3))? (a[30:23]+8'd1):a[30:23];
            end
            sign = a[31];
        end
        else
        begin
            if(a[31]==0)
            begin
                if(NumberOfShift[8])
                begin 
                    temp=MinestNumberOfShift[7:0];
                    sub_result = -({2'b01,b[22:0]})+{({1'b01,a[22:0]}>>temp)};
                    exp = b[30:23];
                end
                else
                begin
                    temp= NumberOfShift[7:0];
                    sub_result = {2'b01,a[22:0]}-{1'b0,({1'b1,b[22:0]}>>temp)};
                 
                    exp = a[30:23];
                end
            end 
            else
            begin
                if(NumberOfShift[8])
                begin 
                    temp=MinestNumberOfShift[7:0];
                    sub_result = ({2'b01,b[22:0]})-{({1'b01,a[22:0]}>>temp)};
                    exp = b[30:23];
                end
                else
                begin
                    temp= NumberOfShift[7:0];
                    sub_result = -{2'b01,a[22:0]}+{1'b0,({1'b1,b[22:0]}>>temp)};
                    exp = a[30:23];
                end 
            end
            if (sub_result[24])
            begin
                minest_sub=-sub_result;
                sign = 1'b1;
            end
            else 
            begin
                minest_sub = sub_result;
                sign = 1'b0;
            end 
            temp_sub = minest_sub<<bulshit;
            mantisa = temp_sub[22:0];
            exp = exp - bulshit;

        end
        result={sign,exp,mantisa};
    end
    
endmodule