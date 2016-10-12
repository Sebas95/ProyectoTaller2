`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:14:41 09/13/2016 
// Design Name: 
// Module Name:    vgaColorConfig 
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
module vgaColorConfig(
	 input wire [9:0] pixel_x,
	 input wire [9:0] pixel_y,
    input wire [2:0] nextRGB,
    input wire video_on,
	 input wire [31:0] txt_on,
    output wire [2:0] rgb
    );
	 
	 //registro para asignar color de salida
	reg [2:0] rgbAux = 0;
	always@*
	begin
	//Mientras la señal no este en pantalla
		if(~video_on)
			rgbAux = "000";
		else	//Si alguno de los elementos que despliego esta en estos momentos encima
			if (txt_on[0] || txt_on[1] || txt_on[2] || txt_on[3] || txt_on[4] || txt_on[5] || txt_on[6]
				|| txt_on[7] || txt_on[8] || txt_on[9] || txt_on[10] || txt_on[11] || txt_on[12]
					|| txt_on[13] || txt_on[14] || txt_on[15] || txt_on[16] || txt_on[17] || txt_on[18]) 
				rgbAux = nextRGB; //asigno en color que proviene del modulo anterior
			else //Si no asigno cero 	
				if(pixel_y > 400)
					rgbAux = 3'b001;
				else
					rgbAux = 3'b000;
	end
	assign rgb = rgbAux;


endmodule
