module mac_controller(input clk , start , output reg [4:0]i , j ,output reg done,ld_buf, register_rst,register_ld);
    parameter A =3'd0, B=3'd1  ,D=3'd3, C = 3'd2 , E = 3'd4;
    reg counter_rst;
    wire coi,coj;
    reg eni, enj;
    reg flag=0 ;
    reg [2:0] ps , ns;
    always @(*)
    begin
        case(ps)
        A: begin
            ns = E;
        end
        E: begin
          ns = B;
        end
        B:begin
            ns = flag? C:B;
        end
        C:
        begin 
          ns = D;
        end
        D : begin
          ns = start ? A:D;
        end
        default:begin
          ns = D;
        end
        endcase
    end
    always @(*)begin
        {eni,enj,done,register_rst,register_ld,counter_rst,ld_buf}=7'd0;
        case(ps)
        A: begin
            register_rst =1;
            i=3'd0;
            // ld_buf=1 ;
        end
        B:begin
            register_ld = 1;
        end
        D : 
        begin
          ld_buf =1 ;
        end
        C :
        begin
            done= 1 ;
        end
        endcase
    end
    always @(posedge clk)
    begin
      ps<=ns;
      if(ps<= B)begin
            i<= i + 5'd1;
            if (i == 5'd31)
              flag = 1;
            else
              flag = 0;
      end 

    end
endmodule