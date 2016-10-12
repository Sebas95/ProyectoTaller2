`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:21 09/10/2016 
// Design Name: 
// Module Name:    VgaPainter 
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
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:57 09/10/2016 
// Design Name: 
// Module Name:    VgaPainter 
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
module VgaPainter(
	input	wire left,
	input	wire right,
	input wire clk_100MHz,
	input wire [8:0] xm, ym,
   output wire hsync, vsync,
   output wire [2:0] rgb,
	output wire video_on,
	output wire [31:0] text_on,
	output wire [9:0] pixel_x, pixel_y
    );


	wire clk1Hz;
	//
   //wire [3:0]  text_on=0;
   wire [10:0] rom_addr;
	wire [7:0]  font_word;



	//devisor de frecuencia pra el controlador VGA
	reg clk_50MHz = 0;
	always @(posedge clk_100MHz)
		clk_50MHz<= ~clk_50MHz;



	//Instanciación de la memoria de las configuraciones
   font_rom font_unit
      (.clk(clk_100MHz), .addr(rom_addr), .data(font_word));	
		
   // instantiate video synchronization unit
   vga_sync vsync_unit
      (.clk(clk_50MHz), 
		.reset(0), 
		.hsync(hsync), 
		.vsync(vsync),
      .video_on(video_on), 
		.p_tick(pixel_tick),
      .pixel_x(pixel_x),
		.pixel_y(pixel_y)		
	);
	
   // instanciacion para desplegar el texto
   TicTacToeTextPainter text_unit
      (
		 .left(left),
		 .right(right),
		 .clk(clk_100MHz),
		 .clk1Hz(clk1Hz),
       .pix_x(pixel_x), 
		 .pix_y(pixel_y),
		 .font_word(font_word),
		 .pixel_tick(pixel_tick),
		 .text_on(text_on),
		 .text_rgb(rgb),
		 .rom_addr(rom_addr),
		 .xm(xm),
		 .ym(ym)
	);
	
	//Divisor de frecuencia de 1HZ
	
		FrecuencyDivider fd (
		.clk_100MHz(clk_100MHz),
		.clk_1Hz(clk1Hz),
		.counter()
	);


endmodule
