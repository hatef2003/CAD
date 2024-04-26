module ProcessUnit(input clk, start, input [31:0]in1, in2 ,in3, in4, w1, w2, w3, w4, output [31:0] out,output zero,done);
wire mw, aw ;
ProcessUnitDataPath dp (clk,mw,aw,in1,in2,in3,in4,w1,w2,w3,w4,zero,out);
ProcessUnitController cntrl(start,clk,mw,aw,done);
endmodule
