module shift_reg(input clk , we, shift, input [7:0] data_in, output [31:0] data_out);
    reg[31:0] value;
    always @(posedge clk)
    begin
        if(shift)
        begin
            value[31:8]<=value[23:0];
        end
        else if(we)
            value[7:0]<=data_in;
        begin
          
        end
    end
    assign data_out = value;
endmodule
