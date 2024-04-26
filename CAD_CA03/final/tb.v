`timescale 1ps/1ps
module tb();
   reg clk=1 , start=0; 
   reg [7:0] x_val=8'd5, y_val=8'd71, z_val=8'd255 ;
   wire done ;
   reg chek = 0 ; 
   top_level #(4) tm (clk , start , x_val, y_val, z_val , done);
   always #10 clk=~clk;
    initial begin 
        #20 
        start =1 ; 
        #20
        start=0; 
        #1000000
        $stop;
    end
    always #10000 
    begin
        if (chek)
            $stop;
    end
    always @(posedge done) begin
       chek = 1;
    end

endmodule