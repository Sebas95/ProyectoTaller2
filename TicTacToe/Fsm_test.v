`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:04:42 10/11/2016
// Design Name:   FinitStateMachine
// Module Name:   C:/Users/Sebastian/Documents/GitHub/ProyectoTaller2/TicTacToe/fsm_test.v
// Project Name:  TicTacToe
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FinitStateMachine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsm_test;

	// Inputs
	reg clk_100MHz=0;
	reg reset;
	reg [8:0] cuadro;
	reg erase;
	reg restart;

	// Outputs
	wire [8:0] x;
	wire [8:0] o;
	wire resetScore;
	wire inc_x_score;
	wire inc_o_score;
	wire displayStartPlaying;
	wire displayGanadorX;
	wire displayGanadorO;
	wire turnoX;
   wire [3:0]state;
	// Instantiate the Unit Under Test (UUT)
	FinitStateMachine uut (
		.clk_100MHz(clk_100MHz), 
		.reset(reset), 
		.cuadro(cuadro), 
		.erase(erase), 
		.restart(restart), 
		.x(x), 
		.o(o), 
		.resetScore(resetScore), 
		.inc_x_score(inc_x_score), 
		.inc_o_score(inc_o_score), 
		.displayStartPlaying(displayStartPlaying), 
		.displayGanadorX(displayGanadorX), 
		.displayGanadorO(displayGanadorO), 
		.turnoX(turnoX),
		.state(state)
	);
	always #5 clk_100MHz=~clk_100MHz ;
	initial begin
		// Initialize Inputs
		
		reset = 0;
		cuadro = 0;
		erase = 0;
		restart = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		cuadro[0]=1;
		#1000;
		cuadro[0]=0;
		#100;
		
		cuadro[3]=1;
		#1000;
		cuadro[3]=0;
		#100;
		
		cuadro[1]=1;
		#1000;
		cuadro[1]=0;
		#100;
		
		cuadro[8]=1;
		#1000;
		cuadro[8]=0;
		#100;
		
		cuadro[2]=1;
		#1000;
		cuadro[2]=0;
		#100;

	end
      
endmodule

