`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:26:11 10/23/2016 
// Design Name: 
// Module Name:    clickedSquare 
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
module clickedSquare(
    input wire [2:0] clicked,
    input wire [9:0] Xlocation,
    input wire [8:0] Ylocation,
    output reg [8:0] clickedMatrix = 0
    );
	 
	localparam NUMERAL_X = 150;
	localparam NUMERAL_Y = 100;	
	localparam ANCHOCASILLAS = 80;
	
	always@*
	//Cuadro arriba izquierda
		if(clicked && (Xlocation > NUMERAL_X) && (Xlocation < NUMERAL_X + ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y) && (Ylocation < NUMERAL_Y + ANCHOCASILLAS))
			clickedMatrix[0] = 1;
	//Cuadro arriba centro
		else if(clicked && (Xlocation > NUMERAL_X + ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 2*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y) && (Ylocation < NUMERAL_Y + ANCHOCASILLAS))
			clickedMatrix[1] = 1;			
	//Cuadro arriba derecha
		else if(clicked && (Xlocation > NUMERAL_X + 2*ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 3*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y) && (Ylocation < NUMERAL_Y + ANCHOCASILLAS))
			clickedMatrix[2] = 1;	
	//Cuadro medio izquierda
		else if(clicked && (Xlocation > NUMERAL_X) && (Xlocation < NUMERAL_X + ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 2*ANCHOCASILLAS))
			clickedMatrix[3] = 1;		
	//Cuadro medio centro
		else if(clicked && (Xlocation > NUMERAL_X + ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 2*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 2*ANCHOCASILLAS))
			clickedMatrix[4] = 1;			
	//Cuadro medio derecha
		else if(clicked && (Xlocation > NUMERAL_X + 2*ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 3*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 2*ANCHOCASILLAS))
			clickedMatrix[5] = 1;				
	//Cuadro abajo izquierda
		else if(clicked && (Xlocation > NUMERAL_X) && (Xlocation < NUMERAL_X + ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + 2*ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 3*ANCHOCASILLAS))
			clickedMatrix[6] = 1;					
	//Cuadro abajo centro
		else if(clicked && (Xlocation > NUMERAL_X + ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 2*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + 2*ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 3*ANCHOCASILLAS))
			clickedMatrix[7] = 1;						
	//Cuadro abajo derecha
		else if(clicked && (Xlocation > NUMERAL_X + 2*ANCHOCASILLAS) && (Xlocation < NUMERAL_X + 3*ANCHOCASILLAS) 
				&& (Ylocation > NUMERAL_Y + 2*ANCHOCASILLAS) && (Ylocation < NUMERAL_Y + 3*ANCHOCASILLAS))
			clickedMatrix[8] = 1;	
	//Si ninguno es clickeado
		else
			clickedMatrix = 9'b0;	
endmodule
