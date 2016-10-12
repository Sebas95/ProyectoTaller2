// Listing 14.6
module TicTacToeTextPainter
   (
    input wire  clk, 
	 input wire  clk1Hz, 
    input wire  [9:0] pix_x, pix_y,
	 input wire [7:0] font_word,
	 input wire pixel_tick,	 
    output wire [3:0] text_on,
    output reg  [2:0] text_rgb =0,
	 output wire [10:0] rom_addr
   );

   // signal declaration
   reg  [6:0] char_addr=0;reg  [6:0] char_addr_s = 0;reg  [6:0] char_addr_st = 0;
   reg  [3:0] row_addr=0;
   wire [3:0] row_addr_s;wire [3:0] row_addr_st;
   reg  [2:0] bit_addr=0;
   wire [2:0] bit_addr_s;wire [2:0] bit_addr_st;
   wire font_bit, score_on;
	reg state_on = 0;
	reg [2:0] nextRGB = 3'b000;

   //-------------------------------------------
   // Temporizador
   //  - Seccion donde se despliega el temporizador
   //  - escala  16-32 
   //-------------------------------------------
   /*assign score_on = (pix_y[9:5]==7) && (pix_x[9:4]<32  && pix_x[9:4]>15);
   assign row_addr_s = pix_y[4:1];
   assign bit_addr_s = pix_x[3:1];
   always @*
      case (pix_x[7:4])	
			4'h0: char_addr_s = 7'h00; //		
			4'h1: char_addr_s = 7'h00; //			
         4'h2: char_addr_s = {3'b011,dig0}; //Aqui escojo segun el digito entrante el que coloco en pantalla
         4'h3: char_addr_s = {3'b011,dig1}; //Aqui escojo segun el digito entrante el que coloco en pantalla		
         4'h4: char_addr_s = 7'h3a; // :
         4'h5: char_addr_s = {3'b011,dig2}; //Aqui escojo segun el digito entrante el que coloco en pantalla
         4'h6: char_addr_s = {3'b011,dig3}; //Aqui escojo segun el digito entrante el que coloco en pantalla
			4'h7: char_addr_s = 7'h00; //
			4'h8: char_addr_s = 7'h00; //
			4'h9: char_addr_s = 7'h00; //
			4'ha: char_addr_s = 7'h00; //
			4'hb: char_addr_s = 7'h00; //
			4'hc: char_addr_s = 7'h00; //
			4'hd: char_addr_s = 7'h00; //
			4'he: char_addr_s = 7'h00; //
			4'hf: char_addr_s = 7'h00; //
			default : char_addr_s = 7'h00;			
      endcase*/
		
   //-------------------------------------------
   // Titulo
   //  - Despliega en el titulo "Tic Tac Toe"
   //  - Escala  32-64 
   //-------------------------------------------
   assign row_addr_st = pix_y[5:2];
   assign bit_addr_st = pix_x[4:2];
   always @*
	begin
		state_on = (pix_y[9:6]==1) && (pix_x[9:4]<13);
		char_addr_st = 7'h00;
		begin			
			case (pix_x[7:4])
				4'h0: char_addr_st = 7'h54; // t
				4'h1: char_addr_st = 7'h69; // i
				4'h2: char_addr_st = 7'h63; // c
				4'h3: char_addr_st = 7'h00; // 
				4'h4: char_addr_st = 7'h54; // t
				4'h5: char_addr_st = 7'h61; // a
				4'h6: char_addr_st = 7'h63; // c
				4'h7: char_addr_st = 7'h00; // 
				4'h8: char_addr_st = 7'h54; // t
				4'h9: char_addr_st = 7'h74; // o
				4'ha: char_addr_st = 7'h65; // e
				4'hb: char_addr_st = 7'h00; // 
				4'hc: char_addr_st = 7'h00; // 
				4'hd: char_addr_st = 7'h00; // 
				4'he: char_addr_st = 7'h00; // 
				4'hf: char_addr_st = 7'h00;
				default : char_addr_st = 7'h00;
			endcase			
		end
	end				
   //-------------------------------------------
   // Aqui se escoge cual color enviar a colocar mientras se encuentre cada elemento encima
   //-------------------------------------------
	localparam red = 3'b001;
   always @*
   begin //Para sincronizar con el pixel y evitar indeseados erroes
	if(pixel_tick)
	begin
      text_rgb = 3'b000;  // fonodo negro
		if (state_on) //Si esta el estado encima
         begin
            char_addr = char_addr_st;
            row_addr = row_addr_st;
            bit_addr = bit_addr_st;
            if (font_bit && pix_x[8:4] > 4'h6)
					text_rgb = 3'b111;						
				else
					text_rgb = 3'b000;
         end		

   end
	end
	


   assign text_on = {score_on,state_on};
   //-------------------------------------------
   // Direccion de la rom para escoger el numero deseado
   //-------------------------------------------
   assign rom_addr = {char_addr, row_addr};
   assign font_bit = font_word[~bit_addr];

endmodule
