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

