`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:49:27 10/19/2016 
// Design Name: 
// Module Name:    Maquina 
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
module Maquina(
	input wire clk_100MHz, restart, erase, randomClick,
	input wire [8:0]cuadro,
	output wire displayGanadorX,
	output wire displayGanadorO,
	output wire [3:0]state,
	output wire [8:0]x,
	output wire [8:0]o,
	output wire resetScore,
	output wire inc_x_score,
	output wire inc_o_score,
	output wire displayStartPlaying,
	output wire displayEmpate,
	output wire turnoX
    );
	
	

	wire reloj;
	wire [8:0]entradas;
	wire gnd=0;
	wire resetPosiciones;
	wire [8:0]guardar_x;
	wire [8:0]guardar_o;
	
	FrecuencyDivider fd(
		.clk_100MHz(clk_100MHz),
		.clk_1Hz(reloj),
		.counter()
		
		);
	 
	TotalDebouncer tdb(
		.sw(cuadro),
		.clk(clk_100MHz),
		.reset(gnd),
		.debounced(entradas)
    );
	 
	 
	 EnigmaMachine fsm(
		//.clk_100MHz(clk_100MHz), 
		.clk_100MHz(reloj),   
		//.cuadro(cuadro),
		.cuadro(entradas),
		.erase(erase),
		.restart(restart),
		.randomClick(randomClick),
		.x(x), 
		.o(o),
		
		.almacenar_x(guardar_x),
		.almacenar_o(guardar_o),
		.resetScore(resetScore), 
		.inc_x_score(inc_x_score), 
		.inc_o_score(inc_o_score), 
		.displayStartPlaying(displayStartPlaying), 
		.displayGanadorX(displayGanadorX), 
		.displayGanadorO(displayGanadorO), 
		.displayEmpate(displayEmpate),
		.turnoX(turnoX),
		.state(state) ,
		.resetPosiciones(resetPosiciones)
		
    );
	 Tablero registro_x(
		//.clk(clk_100MHz),
		.clk(reloj),
		.reset(resetPosiciones),
		.cuadros(guardar_x),
		.posiciones(x)		
	 );
	 
	 Tablero registro_o(
		//.clk(clk_100MHz),
		.clk(reloj),
		.reset(resetPosiciones),
		.cuadros(guardar_o),
		.posiciones(o)		
	 );



endmodule
