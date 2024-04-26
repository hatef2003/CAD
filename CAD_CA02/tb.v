
// module tb();
//  reg a=1 , b=0, c=1 ;
//  wire s , co;
//  reg clk=1 , rst=0 ;
//  always #10 clk = ~clk;
//  wire [7:0] out ; 
//  reg [7:0 ] in = 8'd64;
//  reg pen=0;
//  n_bit_reg #(8) ob(clk , rst , pen,in ,out);
//  initial begin 
//     #10
//     rst = 1 ;
//     b=1; 
//     #5 rst = 0 ;
//     #5
//     a= 1 ; 

//     #20
//     pen = 1 ;
//     #40
//     $stop;
//  end 
// endmodule
// // `timescale 1ns / 1ps
// //   module tb;       
  
// //    reg [9:0]inp1;
// //    reg [9:0]inp2;       
// //    wire [9:0]product;  
        
// //    n_bit_inverter inv (inp1,product);

// //    initial
// //    begin 
// //      inp1=10;
// //      inp2=12;
// //      #30 ;

// //      inp1=13;
// //      inp2=12;
// //      #30 ;
   
// //      inp1=10;
// //      inp2=22;
// //      #30 ;
   
// //      inp1=11;
// //      inp2=22;
// //      #30 ;
   
// //      inp1=12;
// //      inp2=15;
// //      #30 ;
   
// //      $stop;
// //    end 
// // endmodule
module tb ();
reg [4:0] x1=5'b00100 ,x2 = 5'b 00110,x3=5'b00010,x4=5'b00001 ,w1=5'b01000 ,w2=5'b00010;
wire [4:0] out; 
reg clk=0, rst;
always #5 clk = ~clk;
pu p(clk, rst, x4, x1, x3, x2, w1, w2, w2, w2, out);
initial 
begin
  #100 
  $stop;
end
endmodule
// module tb ();
// reg[9:0] a1=10'd32 , a2=10'd12;
// wire [9:0] inverted ; 
// wire [10:0]  result ;
// n_bit_inverter inv1(a2 , inverted); 
// CPS10 cp1 ( inverted , a1 , result);
// initial
// begin
//   #100
//   $stop;
// end

// endmodule