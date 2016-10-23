`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:56:28 10/22/2016 
// Design Name: 
// Module Name:    Tablero 
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
module Tablero(
		input clk,reset,
		input [8:0]cuadros,
		output reg [8:0]posiciones=0
    );
	
	always@(negedge clk , posedge reset)
	if(reset)
		posiciones<=9'b0;
	else
		posiciones<= posiciones + cuadros;
	
	
endmodule
