`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:57:16 10/23/2016 
// Design Name: 
// Module Name:    xo_painter_vga 
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
module xo_painter_vga(
    input [8:0] x_matrix,
    input [8:0] o_matrix
    );
	 
	localparam X_O_SEPARATION = 1;
	localparam X_O_LOCATION_Y = 6;
	
	
	reg  [6:0] char_addr_xo1 = 0;
	
   assign row_addr_xo1 = pix_y[5:2];
   assign bit_addr_xo1 = pix_x[4:2];
	assign xo0_on = (pix_y[9:6]== X_O_LOCATION ) && (pix_x[9:5]==6);
	assign xo1_on = (pix_y[9:6]== X_O_LOCATION ) && (pix_x[9:5]==8);
	assign xo2_on = (pix_y[9:6]== X_O_LOCATION ) && (pix_x[9:5]==10);
	assign xo3_on = (pix_y[9:6]== X_O_LOCATION + X_O_SEPARATION) && (pix_x[9:5]==6);
	assign xo4_on = (pix_y[9:6]== X_O_LOCATION + X_O_SEPARATION ) && (pix_x[9:5]==8);
	assign xo5_on = (pix_y[9:6]== X_O_LOCATION + X_O_SEPARATION ) && (pix_x[9:5]==10);
	assign xo6_on = (pix_y[9:6]== X_O_LOCATION + 2*X_O_SEPARATION ) && (pix_x[9:5]==6);
	assign xo7_on = (pix_y[9:6]== X_O_LOCATION + 2*X_O_SEPARATION ) && (pix_x[9:5]==8);
	assign xo8_on = (pix_y[9:6]== X_O_LOCATION + 2*X_O_SEPARATION ) && (pix_x[9:5]==10);
   always @*
	begin
		char_addr_xo1 = 7'h58;
	end		 
	
	
	always @*
		begin //Para sincronizar con el pixy evitar indeseados erroes
			if(pixel_tick)
				begin
					text_rgb = 3'b000;  
					if(xo8_on || xo7_on || xo6_on || xo5_on || xo4_on || xo3_on || xo2_on || xo1_on || xo0_on)
						begin
							char_addr = char_addr_xo1;
							row_addr = row_addr_xo1;
							bit_addr = bit_addr_xo1;		
							if(font_bit)
								text_rgb = WHITE;	
							else 
								text_rgb = BLACK;	
						end	
				end
		end

endmodule
