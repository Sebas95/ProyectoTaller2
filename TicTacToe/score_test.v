`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:17:36 10/17/2016
// Design Name:   Score_counter
// Module Name:   C:/Users/Sebastian/Documents/GitHub/ProyectoTaller2/TicTacToe/score_test.v
// Project Name:  TicTacToe
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Score_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module score_test;

	// Inputs
	reg increment;
	reg reset;

	// Outputs
	wire [3:0] score;

	// Instantiate the Unit Under Test (UUT)
	Score_counter uut (
		.increment(increment), 
		.reset(reset), 
		.score(score)
	);

	initial begin
		// Initialize Inputs
		increment = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		increment=1;
		#100;
		increment=0;
		#100;
		increment=1;
		#100;
		increment=0;
		#100;
		increment=1;
		#100;
		increment=0;
		#100;
		increment=1;
		#100;
		increment=0;
		#100;
		increment=1;
		#100;
		increment=0;
		#100;
		increment=1;
		#100;
		increment=0;
		#100;
		increment=1;
		#100;
		increment=0;
		#100;
		increment=1;
		#100;
		increment=0;
		#100;
		increment=1;
		#100;
		reset=1;
		#100;
		reset=0;
		#100;
		increment=0;
		#100;
		increment=1;
		#100;
		increment=0;
		#100;
		
	end
      
endmodule

