`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:53:10 10/17/2016 
// Design Name: 
// Module Name:    Score_counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Score_counter(
		input wire increment,reset,
		output reg [3:0]score=0
    );
	
	always@(posedge increment , posedge reset)
	
		if (reset)
			begin
				score <= 4'b0;
			end
		else if (score< 4'b1001)
			begin
				score <= score+1;
			end
		
	
	
	
	
	

endmodule
