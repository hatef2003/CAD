module Controller(  input[2:0] max, 
                    input clk, start, done, done1, 
                    output reg strt, xe1, xe2, xe3, xe4,
                    output reg we1, we2, we3, we4,
                    output reg memre, mem_rst, memwe, sel,
                    output reg [2:0] mem_addr);

parameter idel=4'd0, ldx1=4'd1, ldx2=4'd2, ldx3=4'd3, ldx4=4'd4;
parameter ldw1=4'd5, ldw2=4'd6, ldw3=4'd7, ldw4=4'd8;
parameter START=4'd9, check=4'd10, final=4'd11, memread=4'd12, WAIT=4'd13;
reg [3:0] ps, ns;

always @(*)
begin
    {xe1, xe2, xe3, xe4, we1, we2, we3, we4, memre, memwe, sel, strt, mem_rst}=13'd0;
    case (ps)
        idel:
        begin 
            mem_rst = 1'b1;
            ns = (start) ? ldx1:idel;
        end
        ldx1:
        begin
            sel=1'b1;
            memre=1'b1;
            mem_addr=3'd0;
            xe1=1'b1;
            ns = ldx2;
        end
        ldx2: begin
            sel=1'b1;
            memre=1'b1;
            mem_addr=3'd1;
            xe2=1'b1; 
            ns = ldx3;
        end
        ldx3: begin
            sel=1'b1;
            memre=1'b1;
            mem_addr=3'd2;
            xe3=1'b1;
            ns = ldx4;
        end
        ldx4: begin
            sel=1'b1;
            memre=1'b1;
            mem_addr=3'd3;
            xe4=1'b1;
            ns = ldw1;
        end
        ldw1: begin
            memre=1'b1;
            mem_addr=3'd4;
            we1=1'b1;
            ns = ldw2;
        end
        ldw2: begin
            memre=1'b1;
            mem_addr=3'd5;
            we2=1'b1;
            ns = ldw3;
        end
        ldw3: begin
            memre=1'b1;
            mem_addr=3'd6;
            we3=1'b1;
            ns = ldw4;
        end
        ldw4: begin
            memre=1'b1;
            mem_addr=3'd7;
            we4=1'b1;
            ns = START;
        end
        START: begin
            strt=1'b1;
            ns = WAIT;
        end
        WAIT: begin
            ns = done1 ? check: WAIT;
        end
        check: begin
            ns = done ? final: START;
            {xe1,xe2,xe3,xe4} = 4'd15;
        end
        final: begin
            ns = memread;
        end
        memread: begin
            memre=1'b1;
            mem_addr=max;
            ns= idel;
        end
        default: begin
            ps=idel;
            ns=idel;
        end
    endcase
end

always @(posedge clk)
    ps <= ns;

endmodule
