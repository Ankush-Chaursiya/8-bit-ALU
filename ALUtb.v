`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2024 17:54:50
// Design Name: 
// Module Name: ALUtb
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


module ALUtb();
reg [7:0]a,b;
reg [3:0]sel;

wire [7:0]out;
wire Carryout;
integer i;

ALU dut(.a(a),.b(b),.out(out),.sel(sel),.Carryout(Carryout));

initial begin

      a = 8'h0A;
      b = 4'h02;
      sel = 4'h0;
      
      for (i=0;i<=15;i=i+1)
      begin
       sel = sel + 8'h01;
       #10;
      end;
      end
      
      
   /*   
          initial begin
        // Initialize inputs
        a = 8'hF6;  // Example value: 246 in hex
        b = 8'h0A;  // Example value: 10 in hex
        sel = 4'h0; // Start with the first operation

        // Test each operation for sel = 0 to sel = 15
        for (i = 0; i < 16; i = i + 1) begin
            sel = i;            // Set sel to current operation
            #10;                // Wait for 10 time units
            $display("sel = %b, a = %h, b = %h, out = %h, Carryout = %b", sel, a, b, out, Carryout);
        end

        // Test case to avoid division by zero
        a = 8'h10;  // Example value
        b = 8'h00;  // Division by zero test
        sel = 4'b0011; // Division operation
        #10;
        $display("sel = %b (Division by zero case), a = %h, b = %h, out = %h, Carryout = %b", sel, a, b, out, Carryout);

        // Test case where a = b for comparison operations
        a = 8'h0A;  // Example value
        b = 8'h0A;  // Same value
        sel = 4'b1111; // Equality operation
        #10;
        $display("sel = %b (Equality case), a = %h, b = %h, out = %h, Carryout = %b", sel, a, b, out, Carryout);

        $finish; // End the simulation
        
    end
    */

endmodule
