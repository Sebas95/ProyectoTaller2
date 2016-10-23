`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:20:05 10/22/2016
// Design Name:   Maquina
// Module Name:   C:/Users/Sebastian/Documents/workspace/WelcomeToTheMachine/machinetest.v
// Project Name:  WelcomeToTheMachine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Maquina
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module machinetest;

	// Inputs
	reg clk_100MHz=0;
	reg restart;
	reg erase;
	reg randomClick;
	reg [8:0] cuadro;

	// Outputs
	wire displayGanadorX;
	wire displayGanadorO;
	wire [3:0] state;
	wire [8:0] x;
	wire [8:0] o;
	wire resetScore;
	wire inc_x_score;
	wire inc_o_score;
	wire displayStartPlaying;
	wire displayEmpate;
	wire turnoX;

	// Instantiate the Unit Under Test (UUT)
	Maquina uut (
		.clk_100MHz(clk_100MHz), 
		.restart(restart), 
		.erase(erase), 
		.randomClick(randomClick), 
		.cuadro(cuadro), 
		.displayGanadorX(displayGanadorX), 
		.displayGanadorO(displayGanadorO), 
		.state(state), 
		.x(x), 
		.o(o), 
		.resetScore(resetScore), 
		.inc_x_score(inc_x_score), 
		.inc_o_score(inc_o_score), 
		.displayStartPlaying(displayStartPlaying), 
		.displayEmpate(displayEmpate), 
		.turnoX(turnoX)
	);
always #5 clk_100MHz=~clk_100MHz ;
	initial begin
		// Initialize Inputs
	
		restart = 0;
		erase = 0;
		randomClick = 0;
		cuadro = 0;

				// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		cuadro[3]=1; //marca x en cuadro 0
		#1000;
		cuadro[3]=0;
		#1000;
		
		cuadro[7]=1; //marca o en cuadro 8
		#1000;
		cuadro[7]=0;
		#1000;
		
		cuadro[4]=1; //marca x en cuadro 2
		#1000;
		cuadro[4]=0;
		#1000;
		
		cuadro[8]=1; //marca o en cuadro 1
		#1000;
		cuadro[8]=0;
		#1000;
		
		cuadro[5]=1; //marca x en cuadro 3
		#1000;
		cuadro[5]=0;
		#1000;
		
		
	
		
		
		
		
		randomClick=1;

	end
      
endmodule

