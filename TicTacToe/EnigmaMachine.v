`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:20 10/09/2016 
// Design Name: 
// Module Name:    FinitStateMachine 
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
module EnigmaMachine(
		input clk_100MHz,        
		input [8:0]cuadro,
		input erase,
		input restart,  
		input randomClick,
		input [8:0]x,
		input [8:0]o,
		output reg [8:0]almacenar_x=0,
		output reg [8:0]almacenar_o=0,
		output reg resetScore=0,
		output reg inc_x_score=0,
		output reg inc_o_score=0, 
		output reg displayStartPlaying=0, 
		output reg displayGanadorX=0,
		output reg displayGanadorO=0,
		output reg displayEmpate=0,
		output reg turnoX = 1,
		output reg [3:0]state =0,
		output reg resetPosiciones
		
    );
	 
	
	 reg [3:0] nextState= 0;
	 //Estados disponibles de la maquina de estados con sus valores respectivos
	 localparam [3:0] inicio = 				4'b0000; //0
	 localparam [3:0] verposicion_x = 		4'b0001; //1
	 localparam [3:0] revisar_ganador_O = 	4'b0010; //2
	 localparam [3:0] revisar_ganador_X = 	4'b0011; //3
	 localparam [3:0] r = 						4'b0100; //4
	 localparam [3:0] e =						4'b0101; //5
	 localparam [3:0] retorno =			   4'b0110; //6
	 localparam [3:0] retorno2 =			   4'b0111; //7
	 localparam [3:0] asignar_x =			   4'b1000; //8
	 localparam [3:0] asignar_o =			   4'b1001; //9
	 localparam [3:0] ganador_x =			   4'b1010; //10
	 localparam [3:0] ganador_o =			   4'b1011; //11
	 localparam [3:0] empatando	 =			4'b1100; //12
	 localparam [3:0] verposicion_o = 		4'b1101; //13
	///condiciones
	//si hizo click en algun cuadrante
	wire click = cuadro[0]|cuadro[1]|cuadro[2]|cuadro[3]|cuadro[4]|
					cuadro[5]|cuadro[6]|cuadro[7]|cuadro[8];
	//ganó jugador X
	wire GanoX= (x[0]&x[1]&x[2])|(x[3]&x[4]&x[5])|(x[6]&x[7]&x[8])|
					(x[0]&x[3]&x[6])|(x[1]&x[4]&x[7])|(x[2]&x[5]&x[8])|
					(x[0]&x[4]&x[8])|(x[2]&x[4]&x[6]);
	//ganó jugador O				 
	wire GanoO= (o[0]&o[1]&o[2])|(o[3]&o[4]&o[5])|(o[6]&o[7]&o[8])|
					(o[0]&o[3]&o[6])|(o[1]&o[4]&o[7])|(o[2]&o[5]&o[8])|
					(o[0]&o[4]&o[8])|(o[2]&o[4]&o[6]);
	//revisa si hay empate				
	wire Empate = ((x|o) == 9'b111111111)&(~GanoX)&(~GanoO);
	

	
	always@(cuadro,restart,randomClick,click,Empate,GanoX,GanoO,turnoX,x,o,state,erase)
	begin
		case (state)
			inicio:
			begin
				resetPosiciones<=1;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=1;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX <= 1;
				
				if(click)	nextState<=verposicion_x;
				else			nextState<=inicio;
			end

			verposicion_x: //-------------------------------------------------
			begin
				resetPosiciones<=0;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX<=1;
				
					  if(cuadro[0] & ~x[0] & ~o[0] )	nextState<=asignar_x;
						
				else if(cuadro[1] &  ~x[1] & ~o[1] )		nextState<=asignar_x;			
						
				else if(cuadro[2] & ~x[2] & ~o[2]  )	nextState<=asignar_x;					
				
				else if(cuadro[3] & ~x[3] & ~o[3] )		nextState<=asignar_x;					
						
				else if(cuadro[4] & ~x[4] & ~o[4] )		nextState<=asignar_x;			
				
				else if(cuadro[5] & ~x[5] & ~o[5] )		nextState<=asignar_x;
					
				else if(cuadro[6] & ~x[6] & ~o[6] )		nextState<=asignar_x;			
								
				else if(cuadro[7] & ~x[7] & ~o[7] )		nextState<=asignar_x;
								
				else if(cuadro[8] & ~x[8] & ~o[8] )		nextState<=asignar_x;
			
				else 	nextState<= retorno;
			end
			verposicion_o: //-------------------------------------------------
			begin
				resetPosiciones<=0;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX<=0;
				
					
					  if(cuadro[0] & ~x[0] & ~o[0] ) nextState<=asignar_o;			
				else if(cuadro[1] & ~x[1] & ~o[1] )	nextState<=asignar_o;					
				else if(cuadro[2] & ~x[2] & ~o[2] )	nextState<=asignar_o;			
				else if(cuadro[3] & ~x[3] & ~o[3] )	nextState<=asignar_o;				
				else if(cuadro[4] & ~x[4] & ~o[4] )	nextState<=asignar_o;	
				else if(cuadro[5] & ~x[5] & ~o[5] )	nextState<=asignar_o;					
				else if(cuadro[6] & ~x[6] & ~o[6] )	nextState<=asignar_o;					
				else if(cuadro[7] & ~x[7] & ~o[7] )	nextState<=asignar_o;				
				else if(cuadro[8] & ~x[8] & ~o[8] )	nextState<=asignar_o;		
				else 	nextState<= retorno2;
			end
			asignar_x://--------------------
			begin
				resetPosiciones<=0;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX<=1;
		
				nextState<=revisar_ganador_X;
			
			end
			asignar_o://--------------------
			begin
				resetPosiciones<=0;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX<=0;
				
				
				nextState<=revisar_ganador_O;
			
			end
			revisar_ganador_O://--------2------------
			begin
				resetPosiciones<=0;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX <= 0;
				if(GanoO)			nextState<=ganador_o;
				else if(Empate)	nextState<=empatando;
				else if(~click)	nextState<=retorno;
				else					nextState<= revisar_ganador_O;
			
			end
			revisar_ganador_X://---------3-----------
			begin		
				resetPosiciones<=0;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX <= 1;
				if(GanoX)			nextState<=ganador_x;
				else if(Empate)	nextState<=empatando;
				else if(~click)	nextState<=retorno2;
				else					nextState<= revisar_ganador_X;
			end
				retorno: //-----------6------------------
			begin
				resetPosiciones<=0;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX <= 1;
				if(click)
					nextState<=verposicion_x;
				else if(erase)
					nextState<=e;
				else if (restart)
					nextState<= r;
				else
					nextState<=retorno;
			end
			retorno2: //-----------7------------------
			begin
				resetPosiciones<=0;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX <= 0;
				if(click)
					nextState<=verposicion_o;
				else if(erase)
					nextState<=e;
				else if (restart)
					nextState<= r;
				else
					nextState<=retorno2;
			end
			ganador_x://--------------------
			begin
				resetPosiciones<=0;
				resetScore<=0;
				inc_x_score<=1;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=1;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX <= 0;
				if(randomClick)	nextState<=inicio;
				else					nextState<=ganador_x;
			end
			ganador_o://--------------------
			begin
				resetPosiciones<=0;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=1;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=1;
				displayEmpate<=0;
				turnoX <= 0;
				if(randomClick)	nextState<=inicio;
				else					nextState<=ganador_o;
			end
			empatando://--------------------
			begin
				resetPosiciones<=1;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=1;
				turnoX<=1;
				
				if(randomClick)	nextState<=inicio;
				else					nextState<=empatando;
			end
			r://------------------------------------
			begin
				resetPosiciones<=0;
				resetScore<=1;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX <= 1;
				
				nextState<= inicio;
				
			end
			e://------------------------------------
			begin
				resetPosiciones<=0;
				resetScore<=1;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX<=1;
			
				nextState<=retorno;		
			end
		
			default://------------------------------
			begin
				resetPosiciones<=0;
				resetScore<=0;
				inc_x_score<=0;
				inc_o_score<=0;
				displayStartPlaying<=0;
				displayGanadorX<=0;
				displayGanadorO<=0;
				displayEmpate<=0;
				turnoX<=1;
				
				nextState<=inicio;
			end
				
		
		endcase
	end
	
always @(posedge clk_100MHz )
	state<= nextState;




always@(cuadro,restart,randomClick,click,Empate,GanoX,GanoO,turnoX,x,o,state,erase)
	begin
		case (state)
			inicio:
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;
			end

			verposicion_x: //-------------------------------------------------
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;
		
			end
			verposicion_o: //-------------------------------------------------
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;
		
			end
			asignar_x://--------------------
			begin
				almacenar_o<= 9'b000000000;	
				if(cuadro[0])			almacenar_x<= 9'b000000001;
				else if(cuadro[1]) 	almacenar_x<= 9'b000000010;
				else if(cuadro[2])	almacenar_x<= 9'b000000100;	
				else if(cuadro[3])	almacenar_x<= 9'b000001000;
				else if(cuadro[4])	almacenar_x<= 9'b000010000;
				else if(cuadro[5])	almacenar_x<= 9'b000100000; 
				else if(cuadro[6])	almacenar_x<= 9'b001000000;
				else if(cuadro[7])	almacenar_x<= 9'b010000000;
				else if(cuadro[8])	almacenar_x<= 9'b100000000;
				else                 almacenar_x<= 9'b000000000;	
				
			end
			asignar_o://--------------------
			begin
				almacenar_x<= 9'b000000000;	
				if(cuadro[0])			almacenar_o<= 9'b000000001;
				else if(cuadro[1]) 	almacenar_o<= 9'b000000010;
				else if(cuadro[2])	almacenar_o<= 9'b000000100;	
				else if(cuadro[3])	almacenar_o<= 9'b000001000;
				else if(cuadro[4])	almacenar_o<= 9'b000010000;
				else if(cuadro[5])	almacenar_o<= 9'b000100000; 
				else if(cuadro[6])	almacenar_o<= 9'b001000000;
				else if(cuadro[7])	almacenar_o<= 9'b010000000;
				else if(cuadro[8])	almacenar_o<= 9'b100000000;
				else                 almacenar_o<= 9'b000000000;		
			end
			revisar_ganador_O://--------2------------
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;

				
			
			end
			revisar_ganador_X://---------3-----------
			begin	
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;

				
			end
			
			ganador_x://--------------------
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;

				
			end
			ganador_o://--------------------
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;

				
			end
			empatando://--------------------
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;

				
			end
			r://------------------------------------
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;

				
				
			end
			e://------------------------------------
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;

			
			end
			retorno: //-----------6------------------
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;

				
			end
			retorno2: //-----------7------------------
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;

				
			end
			default://------------------------------
			begin
				almacenar_x<=9'b0;
				almacenar_o<=9'b0;

				
			end 
				
		
		endcase
	end
endmodule
