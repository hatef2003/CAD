`timescale 1ns/1ns

module Tb();

    reg clk=0;
    always #20 clk=~clk;

    reg start=0;
    wire done; 
    wire [31:0] res;
    
    TopModule l(start, clk, done, res);

    initial begin
        #50 start =1;
        #20 start = 0 ;

        #5000 $stop;
    end

endmodule
