`timescale 1ps/1ps
module memory(  input clk, [7:0] addr, 
                input[31:0] datai,
                input we, read, rst,
                input [7:0] write_addr,
                output reg[31:0] datao);

    reg[31:0] read_word;
    reg [31:0] memory [128:0];

  

    always @(posedge clk) 
    begin
        if (rst)
            $readmemh("./file/input.txt", memory);
        if (we)
            memory[write_addr] <= datai; 
        
    end
    assign datao = read ? memory[addr] : 32'bz;

endmodule