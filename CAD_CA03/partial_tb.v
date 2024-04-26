module p_tb();
    reg clk=1  ,rst=0, ld=0 , en=0 ; 
    reg [7:0] ld_val = 0;
    wire [7:0] out_val;
    wire co ; 
    adr_gen_cnt nc (clk , rst , en , out_val);
    always #10 clk = ~clk ;
    initial begin
    rst = 1; 
    #25 
    rst = 0; 
    en = 1;
    #4000 
    $stop;

    end
endmodule