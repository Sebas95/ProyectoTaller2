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
		input [8:0]sw,
		
		//reloj de la nexys
		input clk,
		input reset,
		
		//salidas de los botones sin efecto rebote
		output [8:0]debounced
		
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
	// debpuncer para señal 3
		Debouncer debouncer3(
		.clk(clk), 
		.reset(reset),
		.sw(sw[3]),
		.db(debounced[3])
	);
	// debpuncer para señal 4
		Debouncer debouncer4(
		.clk(clk), 
		.reset(reset),
		.sw(sw[4]),
		.db(debounced[4])
	);
	
	
		// debpuncer para señal 5
	Debouncer debouncer5(
		.clk(clk), 
		.reset(reset),
		.sw(sw[5]),
		.db(debounced[5])
	);
	// debpuncer para señal 6
		Debouncer debouncer6(
		.clk(clk), 
		.reset(reset),
		.sw(sw[6]),
		.db(debounced[6])
	);
	// debpuncer para señal 7
		Debouncer debouncer7(
		.clk(clk), 
		.reset(reset),
		.sw(sw[7]),
		.db(debounced[7])
	);
	// debpuncer para señal 8
		Debouncer debouncer8(
		.clk(clk), 
		.reset(reset),
		.sw(sw[8]),
		.db(debounced[8])
	);


endmodule
