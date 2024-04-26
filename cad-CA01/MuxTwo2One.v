module Mux2to1(input [31:0] a1 , a2 , input select, output [31:0]out);

    assign out = select?a2:a1;


endmodule
