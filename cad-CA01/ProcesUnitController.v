module ProcessUnitController(input start,clk , output reg mw , aw , done);
    parameter IDEL = 3'd0 , INIT = 3'd1 , MULT = 3'd2 , ADD = 3'd3 , RELU = 3'd4 , DONE = 3'd5;
    reg [2:0] ps;
    reg [2:0] ns;
    always @(ps,start)
    begin
        case (ps)
            IDEL: 
                ns<= (start)?INIT:IDEL;
            INIT:
                ns<= (start)?INIT:MULT;  
            MULT:
                ns<= ADD;
            ADD:
                ns<= RELU;
            RELU:
                ns <= DONE;
            DONE:
                ns<= IDEL;
            default: begin
                ns<= IDEL;
                ps<= IDEL;
            end
        endcase
    end
    always @(*) begin
        {mw,aw,done}=3'd0;
         case (ps)
            MULT:
                mw=1'b1;
            ADD:
                aw=1'b1;
            RELU:
                done=1'b1;
            DONE:
                done=1'b1;
        endcase
    end
    
    
    always @(posedge clk) 
        ps <=ns;
endmodule 