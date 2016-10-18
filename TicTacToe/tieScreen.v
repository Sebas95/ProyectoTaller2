`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:31:20 10/18/2016 
// Design Name: 
// Module Name:    tieScreen 
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
module tieScreen(

 input wire start,
 input wire  ce,
 input wire  [9:0] pix_x, pix_y,
 input wire  [7:0] font_word,
 input wire  pixel_tick,	 
 output wire text_on_tie,
 output reg  [2:0] text_rgb =0,
 output wire [10:0] rom_addr
 );

   // signal declaration---------------------------------------------------------------------
	
	//Declaration of the column of the characters
	
   reg  [6:0] char_addr=0;
	
   wire  [3:0] row_addr; 
	
	wire [2:0] bit_addr; 
	
	
	//Declaration for the bit of each row of the ROMM
 
   wire font_bit, title_tie_on;
	
	//Colores Constantes
	localparam BLACK 		= 3'b000;
	localparam RED   		= 3'b100;
	localparam GREEN 		= 3'b010;
	localparam BLUE      = 3'b001;
	localparam WHITE     = 3'b111;
	localparam PINK      = 3'b101;
	localparam YELLOW    = 3'b110;
	localparam LIGHTBLUE = 3'b011;
			
   //-------------------------------------------
   // Titulo
   //  - Despliega en el titulo "Start Playing"
   //  - Escala  32-64 
   //-------------------------------------------
   assign row_addr = pix_y[5:2];
   assign bit_addr = pix_x[4:2];
	assign title_tie_on = (pix_y[9:6]==3) && ((pix_x[9:5]>2) && (pix_x[9:5]<18));
   always @*
	begin		
		char_addr = 7'h00;
		begin				
			case (pix_x[8:5])
				4'h3: char_addr = 7'h53; // S
				4'h4: char_addr = 7'h74; // t
				4'h5: char_addr = 7'h61; // a
				4'h6: char_addr = 7'h72; // r
				4'h7: char_addr = 7'h74; // t
				4'h8: char_addr = 7'h00; // 
				4'h9: char_addr = 7'h50; // P
				4'ha: char_addr = 7'h6c; // l
				4'hb: char_addr = 7'h61; // a
				4'hc: char_addr = 7'h79; // y
				4'hd: char_addr = 7'h69; // i
				4'he: char_addr = 7'h6e; // n
				4'hf: char_addr = 7'h67; // g
				default : char_addr = 7'h00;
			endcase			
		end
	end


	
//-------------------------------------------
// Aqui se escoge cual color enviar a colocar mientras se encuentre cada elemento encima
//-------------------------------------------
   always @*
		begin //Para sincronizar con el pix_y evitar indeseados erroes
			if(pixel_tick && ce)
				begin
					text_rgb = 3'b000;  // fonodo negro
					if (title_tie_on) //Si esta el estado encima
						if(font_bit)
							text_rgb = GREEN;
						else
							text_rgb = BLACK;
					else
						text_rgb = BLACK;
				end
		end
	


   assign text_on_tie = title_tie_on;
   //-------------------------------------------
   // Direccion de la rom para escoger el numero deseado
   //-------------------------------------------
   assign rom_addr = {char_addr, row_addr};
   assign font_bit = font_word[~bit_addr];
		

endmodule
