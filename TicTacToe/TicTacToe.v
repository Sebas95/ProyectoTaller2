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
	input wire up,
	input wire down,	
	input wire left,
	input wire right,
	inout wire ps2d, ps2c,
	output wire hsync, vsync,
   output wire [2:0] rgb,
	output wire [8:0] clickedMatrix,
	output wire [2:0] btn
    );
	 
	reg clk_50MHz = 0;
	always @(posedge CLK_100MHZ)
		clk_50MHz = ~clk_50MHz;
	
	wire [8:0] xm;
	wire [8:0] ym;

	//----------------Estos se tienen que cambiar-----------------------------------------//
	
	reg cePlayingScreen = 1;// (~ceStartScreen & ~ceWinnerXSreen & ~ceWinnerOSreen & ~ceTieSreen ); 
	reg ceStartScreen = 0; // start playing
	reg ceWinnerXSreen = 0; //winner X
	reg ceWinnerOSreen = 0; //winner O
	reg ceTieSreen = 0; //Empate
	
	reg turnoX = 1;
	reg turnoO = 0;
	
		
	reg [8:0] x_matrix = 9'b101010100;
   reg [8:0] o_matrix = ~9'b101010100;
	
	//Los Increment tambien 
	
	//----------------Hasta aqui se tienen que cambiar-----------------------------------------//
	

	
	wire [5:0] scoreX;
	wire [5:0] scoreO;
	
	wire [3:0] digX0 ;
	wire [3:0] digX1 ;
	wire [3:0] digO0 ;
	wire [3:0] digO1 ;

		 
	TwoDigitDeco tdd(
		.clk(CLK_100MHZ), //reloj
		.number(scoreX), //numero de 6 bit
		.decimals(digX0), //decenas
		.units(digX1) //unidades
	 );		 
	 
	TwoDigitDeco tdd2(
		.clk(CLK_100MHZ), //reloj
		.number(scoreO), //numero de 6 bit
		.decimals(digO0), //decenas
		.units(digO1) //unidades
	 );		 
		 
   mouseController mouseC
      (.clk(clk_50MHz), .reset(reset), .ps2d(ps2d), .ps2c(ps2c),
       .posX(xm), .posY(ym), .buttons(btn));
		 
	clickedSquare clickedSquareInst
	 (.clicked(btn),
    .Xlocation(xm),
    .Ylocation(ym),
	 .clickedMatrix(clickedMatrix)
    );
	 
	 
   ScoreCounter scoreCounter(
    .incrementX(up),
    .incrementO(down),
    .scoreX(scoreX),
    .scoreO(scoreO)
    );	 
		 
	FinitStateMachine finit_state_machine(
		//in
		.clk_100MHz(CLK_100MHZ), 
		.reset(), //not implemented yet     
		.cuadro(),
		.erase(),
		.restart(),  
		.randomClick(),
		//out
		.x(),
		.o(),
		.resetScore(),
		.inc_x_score(),
		.inc_o_score(),
		.displayStartPlaying(),
		.displayGanadorX(),
		.displayGanadorO(),
		.displayEmpate(),
		.turnoX(),
		.state()
		
    );
	 
   
		
   VGAPainterColorConfig VGAPCC (
	.up(up),
	.down(down),
	.left(left),
	.right(right),
	.clk_100MHz(CLK_100MHZ),
   .hsync(hsync),
	.vsync(vsync),
   .rgb(rgb),
	.xm(xm),
	.ym(ym),
	.cePS(cePlayingScreen),
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
	.turnoX(turnoX),
	.turnoO(turnoO)
	);

endmodule
