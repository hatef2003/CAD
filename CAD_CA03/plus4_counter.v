module plus4_counter(input clk , rst,en , output reg [3:0] res,output reg co);
    always @(posedge clk)
    begin
      if(rst)
      begin
        res<= 2'd0; 
        co<= 0; 
      end
      else if (en)
      begin
        {co, res} <= res + 4'd4;
      end
    end

endmodule
