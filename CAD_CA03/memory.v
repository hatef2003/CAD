`timescale 1ps/1ps
module memory #(parameter SIZE = 128, NUMBER = 0)(  input clk, [7:0] addr, 
                input[31:0] datai,
                input we, read, rst,
                input [7:0] write_addr,
                input done ,
                output reg[31:0] datao);

    reg [31:0] memory [SIZE-1:0];

    reg [63:0] hex_char;
    integer i;
    integer file;
    always @(posedge clk) 
    begin
        if (rst)
            $readmemh("input.txt", memory);
        if (we)
            memory[write_addr] <= datai; 
        if (done)
        begin 
		    file = $fopen($sformatf("output%0d.txt", NUMBER), "w");

   	 	    for (i = 0; i < SIZE; i = i + 1) begin
      	    		$sformat(hex_char, "%h", memory[i]); 
      	    		$fwrite(file, "%s\n", hex_char);
    	    	end

    	    	$fclose(file); 
        end
    end
    assign datao = read ? memory[addr] : 32'bz;

endmodule

`timescale 1ps/1ps
module OFM #(parameter SIZE = 128, NUMBER = 0)(  input clk, [9:0] addr, 
                input[31:0] datai,
                input we, read, rst,
                input [7:0] write_addr,
                input done ,
                output reg[7:0] datao);

    reg [31:0] memory [SIZE-1:0];

    reg [63:0] hex_char;
    integer i;
    integer file;
    always @(posedge clk) 
    begin
        if (rst)
            $readmemh($sformatf("filter%0d_L2.txt", NUMBER), memory);
        if (we)
            memory[write_addr] <= datai; 
        if (done)
        begin 
		    file = $fopen($sformatf("output%0d.txt", NUMBER), "w");

   	 	    for (i = 0; i < SIZE; i = i + 1) begin
      	    		$sformat(hex_char, "%h", memory[i]); 
      	    		$fwrite(file, "%s\n", hex_char);
    	    	end

    	    	$fclose(file); 
        end
    end
    wire [31:0] line;
    assign line = read ? memory[addr[9:2]] : 32'bz;
    assign datao = (addr[1:0] == 2'd0)? line [31:24]: 
                    (addr[1:0]== 2'd1)? line [23:16]:
                    (addr[1:0]== 2'd2)? line [15:8]:
                    (addr[1:0]== 2'd3)? line [7:0]:8'bz;

endmodule

