module fa(input a , b , cin , output s, co);
    wire a_b_sum;
    Xor x1(a,b,a_b_sum);
    Xor x2(a_b_sum,cin,s);
    carry_out carry (a,b,cin , co);
endmodule