`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:56:13 10/11/2016 
// Design Name: 
// Module Name:    TicTacToe 
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
module TicTacToe(
	input wire CLK_100MHZ,
	input wire reset,
	input wire center,
	input wire down,	
	input wire left,
	input wire right,
	inout wire ps2d, ps2c,
	output wire hsync, vsync,
   output wire [2:0] rgb,
	output wire [8:0] clickedMatrix,
	output wire [2:0] btn,
	output wire restart_on,
	output wire erase_on
    );
	 
	
		
	wire [9:0] xm;
	wire [8:0] ym;
	wire [5:0] scoreX;
	wire [5:0] scoreO;
	wire [3:0] digX0 ;
	wire [3:0] digX1 ;
	wire [3:0] digO0 ;
	wire [3:0] digO1 ;
	 
	wire ceStartScreen; // start playing
	wire ceWinnerXSreen ; //winner X
	wire ceWinnerOSreen ; //winner O
	wire ceTieSreen ; //Empate
	wire turnoX;  //turno actual de x
	wire [8:0] x_matrix; //dice cuales cuadrantes tienen x
   wire [8:0] o_matrix; //dice cuales cuadrantes tienen o
	wire incrementScoreX;  //da un punto a X
	wire incrementScoreO; //da un punto a o
	wire resetScore; //reset del marcador
	wire gnd=0;
	wire leftDebounced, rightDebounced, centerDebounced;
 
	wire erase;
	wire restart;
	TotalDebouncer debouncer(
		.sw({left,right,center}),
		.clk(CLK_100MHZ),
		.reset(gnd),
		.debounced({leftDebounced, rightDebounced, centerDebounced})
		
    );
	 
	 Erase_Restart E_R(
	 .clk(CLK_100MHZ),
    .erase(leftDebounced),
    .restart(rightDebounced),
    .center(centerDebounced),
	 .eraseOut(erase),
	 .restartOut(restart),
	 .restart_on(restart_on),
	 .erase_on(erase_on)
    );

	 
		 
   mouseController mouseC
      (.CLK_100MHZ(CLK_100MHZ), .reset(reset), .ps2d(ps2d), .ps2c(ps2c),
       .posX(xm), .posY(ym), .buttons(btn));
		 
	clickedSquare clickedSquareInst
	 (.clicked(btn),
    .Xlocation(xm),
    .Ylocation(ym),
	 .clickedMatrix(clickedMatrix)
    );
	 
	 
  
	 
	Score game_Score(
	 .CLK_100MHZ(CLK_100MHZ),
    .incrementX(incrementScoreX),
    .incrementO(incrementScoreO),
	 .reset(resetScore),
	 .decimalsX(digX0), //decenas
	 .unitsX(digX1), //unidades
	 .decimalsO(digO0), //decenas
	 .unitsO(digO1) //unidades
    );
	

	Maquina finit_state_machine(
		//in
		.clk_100MHz(CLK_100MHZ),   
		.cuadro(clickedMatrix),
		.erase(erase),
		.restart(restart),  
		.randomClick(btn[1]), //cualquier click
		//out
		.x(x_matrix),
		.o(o_matrix),
		.resetScore(resetScore),
		.inc_x_score(incrementScoreX),
		.inc_o_score(incrementScoreO),
		.displayStartPlaying(ceStartScreen),
		.displayGanadorX(ceWinnerXSreen),
		.displayGanadorO(ceWinnerOSreen),
		.displayEmpate(ceTieSreen),
		.turnoX(turnoX),
		.state()
		
    );
	 
   
		
   VGAPainterColorConfig VGAPCC (
	.up(),
	.down(),
	.left(leftDebounced),
	.right(rightDebounced),
	.clk_100MHz(CLK_100MHZ),
   .hsync(hsync),
	.vsync(vsync),
   .rgb(rgb),
	.xm(xm),
	.ym(ym),
	.ceSS(ceStartScreen),
	.x_matrix(x_matrix),
	.o_matrix(o_matrix),
	.digX0(digX0),
	.digX1(digX1),
	.digO0(digO0),
	.digO1(digO1),
	.ganadorX(ceWinnerXSreen),
	.ganadorO(ceWinnerOSreen),
	.tie(ceTieSreen),
	.turnoX(turnoX)
	);

endmodule
