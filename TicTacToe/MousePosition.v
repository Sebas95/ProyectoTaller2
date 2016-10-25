`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:12:25 10/24/2016 
// Design Name: 
// Module Name:    MousePosition 
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
module MousePosition(
	 input wire clk,
	 input wire m_done_tick,
    input wire [8:0] xChange,
    input wire [8:0] yChange,
    output reg [9:0] mousePositionX = 10'b0,
    output reg [8:0] mousePositionY = 10'b0
    );
	 
	 reg [7:0] xMoveAux = 0;
	 reg [7:0] yMoveAux = 0;
	 wire [7:0] xMove;
	 wire [7:0] yMove;	 
	 
	 //Logic for the x axis movement 
	 always@(posedge clk)
		begin
			if (m_done_tick) 
			begin
				if(~xChange[8])
					begin
						if(~((mousePositionX + xMove) > 10'd635))
							mousePositionX = mousePositionX + xMove;
						else 
							mousePositionX = 10'd635;
					end
				else 
					begin
						if(~(mousePositionX < xMove))
							mousePositionX = mousePositionX - xMove;
						else
							mousePositionX = 10'b0;
					end
			end
		end
	 
	  //Logic for the y axis movement 
	 always@(posedge clk)
		begin
			if (m_done_tick) 
			begin					
				if(yChange[8])
					begin
						if(~((mousePositionY + yMove) > 10'd475))
							mousePositionY = mousePositionY + yMove;
						else
							mousePositionY = 10'd475;
					end
				else
					begin
						if(~(mousePositionY < yMove))
							mousePositionY = mousePositionY - yMove;
						else
							mousePositionY = 10'b0;
					end
			end
		end
	

	 //Here I get the data comming from the mouse module for the X move
	//The positive stay the same, but for the negative a de-complement is needed	 
	 always@*
		begin
			if(xChange[8])
				begin 
					xMoveAux = (xChange[7:0] - 1); //de-complement 
					xMoveAux = ~xMoveAux;
				end
			else
				xMoveAux = xChange[7:0];
		end	 
		
		
	//Here I get the data comming from the mouse module for the Y move
	//The positive stay the same, but for the negative a de-complement is needed
	 always@*
		begin
			if(~yChange[8])
				begin 
					yMoveAux = (-yChange[7:0] - 1); //de-complement 
					yMoveAux = ~yMoveAux;
				end
			else
				yMoveAux = -yChange[7:0];
		end 			
			 
	 assign xMove = xMoveAux;
	 assign yMove = yMoveAux;	 


endmodule
