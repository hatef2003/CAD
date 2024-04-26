module TopModule(   input start, clk, 
                    output done, 
                    output[31:0] max);
    
    wire Done, done1, xe1, xe2, xe3, xe4, we1, we2, we3, we4, memre, memwe, sel, strt, mem_rst;
    wire [2:0] ans_adr, mem_addr;
    wire [31:0] memdataout;

    Controller cntrl(ans_adr, clk, start, Done, done1, strt, xe1, xe2, xe3, xe4, 
                        we1, we2, we3, we4, memre, mem_rst, memwe, sel, mem_addr);

    DataPath dpth(clk, xe1, xe2, xe3, xe4, we1, we2, we3, we4, memwe, sel, 
                    memre, mem_rst, strt, mem_addr, Done, done1, ans_adr, memdataout);

    assign done = Done;
    assign max = Done ? memdataout: 32'bz;

endmodule