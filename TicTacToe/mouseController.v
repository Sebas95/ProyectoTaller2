`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:53 10/22/2016 
// Design Name: 
// Module Name:    mouseController 
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
module mouseController(
		input wire clk, reset,
		inout wire ps2d, ps2c,
		output reg [9:0] posX = 10'b0,
		output reg [8:0] posY = 10'b0,
		output wire [2:0] buttons,
		output reg entro
    );

    wire [8:0] xm; //[7:0] magnitud de la velocidad, [8] direcion
	 wire [8:0] ym; //[7:0] magnitud de la velocidad, [8] direcion
	 wire [7:0] xMove; //cantidad de pixeles que debe moverse el puntero
	 wire [5:0] yMove; //cantidad de pixeles que debe moverse el puntero
    wire m_done_tick;
	 
	 reg [7:0] xMoveAux = 0;
	 reg [7:0] yMoveAux = 0;
	 
	 
	 localparam FINAL_POS_X = 635;
	 localparam FINAL_POS_Y = 480;
	 localparam MOV_SLOW = 2;
	 localparam MOV_MEDIUM = 5;
	 localparam MOV_FAST = 10;
		
	 mouse mouse_unit
		(.clk(clk), .reset(reset), .ps2d(ps2d), .ps2c(ps2c),
		.xm(xm),.ym(ym),.btnm(buttons),.m_done_tick(m_done_tick));
		
	 
	 //Logic for the x axis movement 
	 always@(posedge clk)
		begin
			if (m_done_tick) 
			begin
				if(~xm[8])
					begin
						if(~((posX + xMove) > 10'd635))
							posX = posX + xMove;
						else 
							posX = 10'd635;
					end
				else 
					begin
						if(~(posX < xMove))
							posX = posX - xMove;
						else
							posX = 10'b0;
					end
			end
		end
	 
	  //Logic for the y axis movement 
	 always@(posedge clk)
		begin
			if (m_done_tick) 
			begin					
				if(ym[8])
					begin
						if(~((posY + yMove) > 10'd475))
							posY = posY + yMove;
						else
							posY = 10'd475;
					end
				else
					begin
						if(~(posY < yMove))
							posY = posY - yMove;
						else
							posY = 10'b0;
					end
			end
		end
	

	 //Here I get the data comming from the mouse module for the X move
	//The positive stay the same, but for the negative a de-complement is needed	 
	 always@*
		begin
			if(xm[8] && ~buttons)
				begin 
					xMoveAux = (xm[7:0] - 1); //de-complement 
					xMoveAux = ~xMoveAux;
				end
			else
				if(~buttons)
					xMoveAux = xm[7:0];
		end	 
		
		
	//Here I get the data comming from the mouse module for the Y move
	//The positive stay the same, but for the negative a de-complement is needed
	 always@*
		begin
			if(~ym[8] && ~buttons)
				begin 
					yMoveAux = (-ym[7:0] - 1); //de-complement 
					yMoveAux = ~yMoveAux;
				end
			else
				if(~buttons)
					yMoveAux = -ym[7:0];
		end 			
			 
	 assign xMove = xMoveAux;
	 assign yMove = yMoveAux;
	 
	 
endmodule