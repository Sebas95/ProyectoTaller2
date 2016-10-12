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
	input wire left,
	input wire right,
	inout wire ps2d, ps2c,
	output wire hsync, vsync,
   output wire [2:0] rgb
    );
	 
	reg clk_50MHz = 0;
	always @(posedge CLK_100MHZ)
		clk_50MHz = ~clk_50MHz;

   mouse mouse_unit
      (.clk(clk_50MHz), .reset(reset), .ps2d(ps2d), .ps2c(ps2c),
       .xm(xm), .ym(), .btnm(btnm),
       .m_done_tick(m_done_tick));
		 
   VGAPainterColorConfig VGAPCC (
	.left(left),
	.right(right),
	.clk_100MHz(CLK_100MHZ),
   .hsync(hsync),
	.vsync(vsync),
   .rgb(rgb)
	);

endmodule
