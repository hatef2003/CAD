module CPA10(input cin , input [9:0] A, B ,output [10:0] S);

wire [10:0] C;

genvar i;
generate
    for (i = 0; i < 10; i = i + 1) begin : fa
        fa FA (A[i],B[i], C[i], S[i],C[i+1] );
    end
endgenerate

assign C[0] = cin;
assign S[10] = C[10];

endmodule
module CPA11(input cin,input [10:0] A, B ,output [11:0] S);
wire [11:0] C;

genvar i;
generate
    for (i = 0; i < 11; i = i + 1) begin : fa
        fa FA (A[i],B[i],C[i],S[i],C[i+1]);
    end
endgenerate

assign C[0] = cin;
assign S[11] = C[11];

endmodule
module CPS10( input [9:0] A, B ,output [10:0] S);

wire [10:0] C;

genvar i;
generate
    for (i = 0; i < 10; i = i + 1) begin : fa
        fa FA (A[i],B[i], C[i], S[i],C[i+1] );
    end
endgenerate

assign C[0] = 1;
assign S[10] = S[9];
endmodule
module CPS11(input [10:0] A, B ,output [11:0] S);
wire [11:0] C;

genvar i;
generate
    for (i = 0; i < 11; i = i + 1) begin : fa
        fa FA (A[i],B[i],C[i],S[i],C[i+1]);
    end
endgenerate

assign C[0] = 1;
assign S[11] = S[10];

endmodule