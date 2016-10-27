`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:14:16 10/26/2016 
// Design Name: 
// Module Name:    Score 
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
module Score(
	 input wire CLK_100MHZ,
    input wire incrementX,
    input wire incrementO,
	 input wire reset,
	 output wire [3:0]decimalsX, //decenas
	 output wire [3:0] unitsX, //unidades
	 output wire [3:0]decimalsO, //decenas
	 output wire [3:0] unitsO //unidades
    );

	wire scoreO, scoreX;
 ScoreCounter scoreCounter(
	 .clk(CLK_100MHZ),
    .incrementX(incrementX),
    .incrementO(incrementO),
    .scoreX(scoreX),
    .scoreO(scoreO),
	 .reset(resetScore)
    );

TwoDigitDeco tdd(
		.clk(CLK_100MHZ), //reloj
		.number(scoreX), //numero de 6 bit
		.decimals(decimalsX), //decenas
		.units(unitsX) //unidades
	 );		 
	 
	TwoDigitDeco tdd2(
		.clk(CLK_100MHZ), //reloj
		.number(scoreO), //numero de 6 bit
		.decimals(decimalsO), //decenas
		.units(unitsO) //unidades
	 );		 	 

endmodule
