module n_bit_inverter # (parameter N =10)(input [N-1:0] A,output [N-1:0] S);


genvar i;
generate
    for (i = 0; i < N; i = i + 1) begin : inverter
        inverter INV (A[i],S[i]);
    end
endgenerate
endmodule