`timescale 1ns/1ns

module DataPath(input clk, 
                input we1, we2, we3, we4,
                input We1, We2, We3, We4, 
                input mem_we, sel, mem_read, mem_rst, strt,
                input [2:0] mem_addr, 
                output done, done1, 
                output [2:0] max, 
                output [31:0] memout);

    wire[31:0] w1, w2, w3, w4;
    wire[31:0] x1, x2, x3, x4;
    wire[31:0] new_x1, new_x2, new_x3, new_x4;
    wire[31:0] pu_x1, pu_x2, pu_x3, pu_x4;
    wire done2, done3, done4;
    wire zero1, zero2, zero3, zero4;
    reg[31:0] mem_datai;
    wire[31:0] mem_datao;

    Mux2to1 m1 (pu_x1,mem_datao,sel,new_x1);
    Mux2to1 m2 (pu_x2,mem_datao,sel,new_x2);
    Mux2to1 m3 (pu_x3,mem_datao,sel,new_x3);
    Mux2to1 m4 (pu_x4,mem_datao,sel,new_x4);

    register x1_reg(new_x1, clk, we1, x1);
    register x2_reg(new_x2, clk, we2, x2);
    register x3_reg(new_x3, clk, we3, x3);
    register x4_reg(new_x4, clk, we4, x4);
    register w1_reg(mem_datao, clk, We1, w1);
    register w2_reg(mem_datao, clk, We2, w2);
    register w3_reg(mem_datao, clk, We3, w3);
    register w4_reg(mem_datao, clk, We4, w4);

    ProcessUnit pu1(.clk(clk), .start(strt), .in1(x1), .in2(x2), .in3(x3), .in4(x4), 
                    .w1(w1), .w2(w2), .w3(w3), .w4(w4), .out(pu_x1), .zero(zero1), .done(done1));

    ProcessUnit pu2(.clk(clk), .start(strt), .in1(x1), .in2(x2), .in3(x3), .in4(x4), 
                    .w1(w2), .w2(w1), .w3(w3), .w4(w4), .out(pu_x2), .zero(zero2), .done(done2));

    ProcessUnit pu3(.clk(clk), .start(strt), .in1(x1), .in2(x2), .in3(x3), .in4(x4), 
                    .w1(w3), .w2(w2), .w3(w1), .w4(w4), .out(pu_x3), .zero(zero3), .done(done3));

    ProcessUnit pu4(.clk(clk), .start(strt), .in1(x1), .in2(x2), .in3(x3), .in4(x4),
                    .w1(w4), .w2(w2), .w3(w3), .w4(w1), .out(pu_x4), .zero(zero4), .done(done4));

    Memory mem(.clk(clk), .addr(mem_addr), .datai(mem_datai), .we(mem_we), .read(mem_read), .rst(mem_rst), .datao(mem_datao));

    assign max = (zero1 & zero2 & zero3) ? 3'd3 :
                 (zero1 & zero2 & zero4) ? 3'd2 : 
                 (zero1 & zero3 & zero4) ? 3'd1 : 
                 (zero3 & zero2 & zero4) ? 3'd0 : 3'bz;

    assign done = ((zero1 & zero2 & zero3) | (zero1 & zero2 & zero4) | 
                    (zero1 & zero3 & zero4) | (zero3 & zero2 & zero4)) ? 1'b1 : 1'b0;
                    
    assign memout = mem_datao;

endmodule