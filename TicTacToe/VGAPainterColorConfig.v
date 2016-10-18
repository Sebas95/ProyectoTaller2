`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:05 09/19/2016 
// Design Name: 
// Module Name:    VGAPainterColorConfig 
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
module VGAPainterColorConfig(
	input wire up,
	input wire down,
	input wire left,
	input wire right,
	input wire cePS,
	input wire ceWSX,
	input wire ceWSO,
	input wire ceT,
	input wire ceSS,	
	input wire clk_100MHz,
	input wire [8:0] xm, ym,	
   output wire hsync, vsync,
   output wire [2:0] rgb	
	);
	wire [2:0] nextRGB;
	wire [31:0] txt_on;
	wire [2:0] video_on;
	wire [9:0] pixel_x, pixel_y;
	wire text_on_start;
	wire [2:0] text_on_winner;
	
		//Instanciacion para la sincronización con vga
	 
	 	VgaPainter vgap (  
		.left(left),
		.right(right),
		.clk_100MHz(clk_100MHz), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(nextRGB),
		.video_on(video_on),
		.text_on(txt_on),
		.text_on_start(text_on_start),
		.text_on_winner(text_on_winner),
		.pixel_x(pixel_x),
		.pixel_y(pixel_y),
		.xm(xm),
		.ym(ym),
		.up(up),
		.down(down),
		.cePS(cePS),
		.ceWSX(ceWSX),
		.ceSS(ceSS)		
	);	
	
	//Instanciación para la configuración de colores
		vgaColorConfig colorConfg (
		.nextRGB(nextRGB), 
		.video_on(video_on), 
		.rgb(rgb),
		.txt_on(txt_on),
		.pixel_x(pixel_x),
		.pixel_y(pixel_y),
		.text_on_start(text_on_start),
		.text_on_winner(text_on_winner)
	);


endmodule
