`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:29 10/23/2016 
// Design Name: 
// Module Name:    ScoreCounter 
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
module ScoreCounter(
    input wire incrementX,
    input wire incrementO,
    output reg [5:0] scoreX = 0,
    output reg [5:0] scoreO = 0
    );
	 
	 always@(posedge incrementX)
		scoreX = scoreX + 1;
		
	 always@(posedge incrementO)
		scoreO = scoreO + 1;		

endmodule
