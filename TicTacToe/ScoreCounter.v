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
	 input wire clk,
    input wire incrementX,
    input wire incrementO,
	 input wire reset,
    output reg [5:0] scoreX = 0,
    output reg [5:0] scoreO = 0
    );
	 
	 reg [5:0] scoreXAux = 0;
	 reg [5:0] scoreOAux = 0;
	 
	 reg resetAux = 1;
	 
	 always@(posedge clk)
		if(reset)
			begin
				scoreX = 6'b0;
				scoreO = 6'b0;
				resetAux = 0;
			end
		else
			begin
				resetAux = 1;
				scoreX = scoreXAux;
				scoreO = scoreOAux;
			end
			
	 always@(posedge incrementX or negedge resetAux)
		if(~resetAux)
			begin
				scoreXAux = 6'b0;
			end
		else
			begin
				scoreXAux = scoreXAux + 1;
			end
		
	 always@(posedge incrementO or negedge resetAux)
		if(~resetAux)
			begin
				scoreOAux = 6'b0;
			end
		else
			begin
				scoreOAux = scoreOAux + 1;
			end
		

endmodule
