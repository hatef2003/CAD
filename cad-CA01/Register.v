`timescale 1ns/1ns
module register(input [31:0] in ,input clk ,we, output reg [31:0] out);

    reg [31:0] value;
    always @(posedge clk) begin
        if(we)
        begin
           value=in;
        end
        out=value;
    end

endmodule
