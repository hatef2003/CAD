module ProcessUnitDataPath(input clk , mw , aw, input [31:0] x1,x2,x3,x4,w1,w2,w3,w4,output zero ,  output [31:0]out);
    wire [31:0] MultRes1 , MultRes2 , MultRes3 , MultRes4;
    wire [31:0] _MultRes1 , _MultRes2 , _MultRes3 , _MultRes4;
    wire [31:0] AddRes11 , AddRes12 , AddRes21 , _Addres21;
    FloatMultiplier fm1 (x1,w1,MultRes1);
    FloatMultiplier fm2 (x2,w2,MultRes2);
    FloatMultiplier fm3 (x3,w3,MultRes3);
    FloatMultiplier fm4 (x4,w4,MultRes4);
    register mr1 (MultRes1, clk, mw, _MultRes1);
    register mr2 (MultRes2, clk, mw, _MultRes2);
    register mr3 (MultRes3, clk, mw, _MultRes3);
    register mr4 (MultRes4, clk, mw, _MultRes4);
    register ar1 (AddRes21, clk, aw, _Addres21);
    FloatAdder fa11(_MultRes1,_MultRes2,AddRes11);
    FloatAdder fa12(_MultRes3,_MultRes4,AddRes12);
    FloatAdder fa21(AddRes11 ,AddRes12 ,AddRes21);
    //relu
    assign out = (_Addres21[31])?0:_Addres21;
    assign zero = (out==32'd0)?1:0; 


endmodule