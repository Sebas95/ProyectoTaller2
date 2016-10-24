`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:29:29 10/23/2016 
// Design Name: 
// Module Name:    Erase_Restart 
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
module Erase_Restart(
	 input clk,
    input erase,
    input restart,
    input center,
	 output reg eraseOut = 0,
	 output reg  restartOut= 0,
	 output reg erase_on = 0,
	 output reg  restart_on= 1	 
    );
	 
	 wire pressed = (erase | restart);
	 
	// reg restartOut = 0;;
	 //reg eraseOut = 0;
	 //reg restart_on = 1;
	 //reg erase_on = 0;
	 
	 always@(posedge clk)
		if (center && restart_on)
			 restartOut = 1;
		else if (center && erase_on)
			 eraseOut = 1;
		else 
			begin
				eraseOut = 0;
				restartOut = 0;
			end

	always@(posedge pressed)
		begin
			erase_on = ~ erase_on;
			restart_on = ~restart_on;
		end
			
endmodule
