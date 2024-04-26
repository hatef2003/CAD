module two_bit_counter(input clk , rst , en , output reg [1:0] out , output reg co);
    always @(posedge clk)
    begin
      if(rst)
      begin
        out<= 2'd0; 
        co<= 0; 
      end
      else if (en)
      begin
        {co, out} <= out + 2'd1;
      end
    end
endmodule

module four_bit_counte(input clk , rst , en , output reg [3:0] out , output reg co);
    always @(posedge clk)
    begin
      if(rst)
      begin
        out<= 4'd3; 
        co<= 0; 
      end
      else if (en)
      begin
        if (out != 4'd15)
        {co, out} <= out + 4'd1; 
        else
          out<= 4'd3;
      end
    end

endmodule