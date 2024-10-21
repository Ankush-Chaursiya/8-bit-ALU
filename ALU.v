`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2024 17:27:10
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/* 8 bit ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 0000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 0001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 0010  |   ALU_Out = A * B;
----------------------------------------------------------------------
| 0011  |   ALU_Out = A / B;
----------------------------------------------------------------------
| 0100  |   ALU_Out = A << 1;
----------------------------------------------------------------------
| 0101  |   ALU_Out = A >> 1;
----------------------------------------------------------------------
| 0110  |   ALU_Out = A rotated left by 1;
----------------------------------------------------------------------
| 0111  |   ALU_Out = A rotated right by 1;
----------------------------------------------------------------------
| 1000  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 1001  |   ALU_Out = A or B;
----------------------------------------------------------------------
| 1010  |   ALU_Out = A xor B;
----------------------------------------------------------------------
| 1011  |   ALU_Out = A nor B;
----------------------------------------------------------------------
| 1100  |   ALU_Out = A nand B;
----------------------------------------------------------------------
| 1101  |   ALU_Out = A xnor B;
----------------------------------------------------------------------
| 1110  |   ALU_Out = 1 if A>B else 0;
----------------------------------------------------------------------
| 1111  |   ALU_Out = 1 if A=B else 0; 
*/
module ALU(
    input [7:0]a,b,
    input [3:0]sel,
    output [7:0]out,
    output Carryout
    );
   reg [7:0] Aluresult;
   wire [8:0] temp;
   assign out = Aluresult;
   assign temp = {1'b0, a} + {1'b0,b};
   assign Carryout = temp[8]; 
   
   always @(*)begin
   case(sel)
   4'b0000: Aluresult = a + b;
   4'b0001: Aluresult = a - b;
   4'b0010: Aluresult = a * b;
   4'b0011: Aluresult = a / b;
   4'b0100: Aluresult = a << 1;
   4'b0101: Aluresult = a >> 1;
   4'b0110: Aluresult = {a[6:0],a[7]};
   4'b0111: Aluresult = {a[0],a[7:1]};
   4'b1000: Aluresult = a & b;
   4'b1001: Aluresult = a | b;
   4'b1010: Aluresult = a ^ b;
   4'b1011: Aluresult = ~(a | b);
   4'b1100: Aluresult = ~(a & b);
   4'b1101: Aluresult = ~(a ^ b);
   4'b1110:begin 
   if(a>b)
   Aluresult = 8'd1;
   else
   Aluresult = 8'd0;
   end
   4'b1111: begin 
   if(a == b)
   Aluresult = 8'd1;
   else 
   Aluresult = 8'd0;
   end
   default: Aluresult = 8'd0;
   endcase
   end
   
endmodule
