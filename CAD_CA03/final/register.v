`timescale 1ps/1ps
module eight_bit_register(input clk , ld , rst ,input[7:0] pin , output reg [7:0] out);
    reg[7:0] val ; 
    always @(posedge clk) begin
        if (rst)
            val<=8'd0;
        else if (ld)
        begin
            val <= pin ;
        end
        out <= val ;
    end
endmodule
module twelve_bit_register(input clk , ld , rst ,input[11:0] pin , output reg [11:0] out);
    reg[11:0] val ; 
    always @(posedge clk) begin
        if (rst)
            val<=12'd0;
        else if (ld)
        begin
            val <= pin ;
        end
        out <= val ;
    end
endmodule