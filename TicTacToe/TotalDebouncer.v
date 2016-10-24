`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:29:02 09/11/2016 
// Design Name: 
// Module Name:    TotalDebouncer 
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
module TotalDebouncer(
		//botones con entradas con efecto rebote
		input [2:0]sw,
		
		//reloj de la nexys
		input clk,
		input reset,
		
		//salidas de los botones sin efecto rebote
		output [2:0]debounced
		
    );


	// debpuncer para señal 0
	Debouncer debouncer0(
		.clk(clk), 
		.reset(reset),
		.sw(sw[0]),
		.db(debounced[0])
	);
	// debpuncer para señal 1
		Debouncer debouncer1(
		.clk(clk), 
		.reset(reset),
		.sw(sw[1]),
		.db(debounced[1])
	);
	// debpuncer para señal 2
		Debouncer debouncer2(
		.clk(clk), 
		.reset(reset),
		.sw(sw[2]),
		.db(debounced[2])
	);



endmodule
