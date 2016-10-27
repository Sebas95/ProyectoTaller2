`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:53 10/22/2016 
// Design Name: 
// Module Name:    mouseController 
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
module mouseController(
		input wire CLK_100MHZ, reset,
		inout wire ps2d, ps2c,
		output wire [9:0] posX,
		output wire [8:0] posY,
		output wire [2:0] buttons
    );
	 
	reg clk = 0;
	always @(posedge CLK_100MHZ)
	clk = ~clk;

    wire [8:0] xm; //[7:0] magnitud de la velocidad, [8] direcion
	 wire [8:0] ym; //[7:0] magnitud de la velocidad, [8] direcion
    wire m_done_tick;
	 
		
	 mouse mouse_unit
		(.clk(clk), .reset(reset), .ps2d(ps2d), .ps2c(ps2c),
		.xm(xm),.ym(ym),.btnm(buttons),.m_done_tick(m_done_tick));
		
	 

	MousePosition mousePosition (
	 .clk(clk),
	 .m_done_tick(m_done_tick),
	 .xChange(xm),
	 .yChange(ym),
	 .mousePositionX(posX),
	 .mousePositionY(posY)
	 );
	 
	 
endmodule