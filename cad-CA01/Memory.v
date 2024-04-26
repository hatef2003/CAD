`timescale 1ns/1ns

module Memory(  input clk, [2:0] addr, 
                input[31:0] datai,
                input we, read, rst,
                output reg[31:0] datao);

    reg[31:0] read_word;
    reg [31:0] memory [7:0];

  

    always @(posedge clk) 
    begin
        if (rst)
            $readmemh("data_file.txt", memory);
        if (we)
            memory[addr] <= datai; 
        
    end
    assign datao = read ? memory[addr] : 32'bz;

endmodule