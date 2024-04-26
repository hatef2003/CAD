module multiplier_4_x_4(product,inp1,inp2);

  output [7:0]product;
  input [3:0]inp1;
  input [3:0]inp2;
  wire ad1, and2, and3, and4, and5, and6, and7, and8, and9, and10, and11, and12, and13, and14, and15, and16;
  And and32234(inp1[0],inp2[0],and1);
  assign product[0]= and1;
  
  wire x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17;
  
  ha ha1((inp1[1]&inp2[0]),(inp1[0]&inp2[1]),product[1],x1);
  fa fa1(inp1[1]&inp2[1],(inp1[0]&inp2[2]),x1,x2,x3);
  fa fa2((inp1[1]&inp2[2]),(inp1[0]&inp2[3]),x3,x4,x5);
  ha ha2((inp1[1]&inp2[3]),x5,x6,x7);
  
  ha ha3(x2,(inp1[2]&inp2[0]),product[2],x15);
  fa fa5(x4,(inp1[2]&inp2[1]),x15,x14,x16);
  fa fa4(x6,(inp1[2]&inp2[2]),x16,x13,x17);
  fa fa3(x7,(inp1[2]&inp2[3]),x17,x9,x8);
  
  ha ha4(x14,(inp1[3]&inp2[0]),product[3],x12);
  fa fa8(x13,(inp1[3]&inp2[1]),x12,product[4],x11);
  fa fa7(x9,(inp1[3]&inp2[2]),x11,product[5],x10);
  fa fa6(x8,(inp1[3]&inp2[3]),x10,product[6],product[7]);
  
endmodule