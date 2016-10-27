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
	////           INPUTS
	input wire clk_100MHz, 
	input wire restart, //señal para reiniciar juego 
	input wire erase,  //señal para borrar marcador
	input wire randomClick, //click en cualquier posicion de pantalla
	input wire [8:0]cuadro, //posición del tablero clickeada
	//					OUTPUTS
	output wire displayGanadorX, //desplegar pantalla Winner O
	output wire displayGanadorO, //desplegar pantalla Winner O
	output wire [3:0]state, //estado
	output wire [8:0]x, //1 si la posición es ocupada por X
	output wire [8:0]o, //1 si la posición es ocupada por O
	output wire resetScore, //reset del marcador
	output wire inc_x_score, //incrementar marcador a favor de X
	output wire inc_o_score, //incrementar marcador a favor de O
	output wire displayStartPlaying, //desplegar el mensaje "StartPlaying"
	output wire displayEmpate, //desplegar la pantalla de empate
	output wire turnoX //turno del jugador X y el negado es del jugador O
    );
	

	wire gnd=0;
	wire resetPosiciones;
	wire [8:0]guardar_x;
	wire [8:0]guardar_o;
	
	

	 
	 
	 EnigmaMachine fsm(
		.clk_100MHz(clk_100MHz), 
		.cuadro(cuadro),
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
		.clk(clk_100MHz),
		.reset(resetPosiciones),
		.cuadros(guardar_x),
		.posiciones(x)		
	 );
	 
	 Tablero registro_o(
		.clk(clk_100MHz),
		.reset(resetPosiciones),
		.cuadros(guardar_o),
		.posiciones(o)		
	 );

endmodule
