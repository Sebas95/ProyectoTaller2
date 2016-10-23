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
module FinitStateMachine(
		input clk_100MHz, reset,       
		input [8:0]cuadro,
		input erase,
		input restart,  
		input randomClick,
		output reg [8:0]x=0,
		output reg [8:0]o=0,
		output reg resetScore=0,
		output reg inc_x_score=0,
		output reg inc_o_score=0,
		output reg displayStartPlaying=0,
		output reg displayGanadorX=0,
		output reg displayGanadorO=0,
		output reg displayEmpate=0,
		output reg turnoX = 1,
		output reg [3:0]state =0
		
    );
	 
	 
	 reg [3:0] nextState= 0;
	 reg [8:0] ocupada= 0;
	 //Estados disponibles de la maquina de estados con sus valores respectivos
	 localparam [3:0] inicio = 				4'b0000; //0
	 localparam [3:0] verposicion = 			4'b0001; //1
	 localparam [3:0] revisar_ganador_O = 	4'b0010; //2
	 localparam [3:0] revisar_ganador_X = 	4'b0011; //3
	 localparam [3:0] r = 						4'b0100; //4
	 localparam [3:0] e =						4'b0101; //5
	 localparam [3:0] retorno =			   4'b0110; //6
	 localparam [3:0] espera =			   	4'b0111; //7
	 
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
	wire Empate = x[0]&x[1]&x[2]&x[3]&x[4]&x[5]&x[6]&x[7]&x[8]&
					  o[0]&o[1]&o[2]&o[3]&o[4]&o[5]&o[6]&o[7]&o[8]&
					  (~GanoX)&(~GanoO);
	
	always@(*)
	begin
		case (state)
			inicio:
			begin
				displayStartPlaying=1;
				inc_x_score=0;
				inc_o_score=0;
				displayGanadorX=0;
				displayGanadorO=0;
				displayEmpate=0;
				resetScore=0;
				turnoX=1;
				if(click)
				begin
					displayStartPlaying=0;
					nextState=verposicion;
				end
				else
					nextState=inicio;
			end

			verposicion: //-------------------------------------------------
			begin
			if(cuadro[0] & turnoX & ~ocupada[0])
			begin
					nextState=revisar_ganador_X;
					x[0]=1;
			end
			else if(cuadro[0] & ~turnoX  & ~ocupada[0] )
			begin
					nextState=revisar_ganador_O;
					o[0]=1;
			end
			else if(cuadro[1] & turnoX & ~ocupada[1]   )
			begin
					nextState=revisar_ganador_X;
					x[1]=1;
			end
			else if(cuadro[1] & ~turnoX  & ~ocupada[1]   )
			begin
					nextState=revisar_ganador_O;
					o[1]=1;
			end
			else if(cuadro[2] & turnoX & ~ocupada[2]    )
			begin
					nextState=revisar_ganador_X;
					x[2]=1;
			end
			else if(cuadro[2] & ~turnoX  & ~ocupada[2]    )
			begin
					nextState=revisar_ganador_O;
					o[2]=1;
			end
			else if(cuadro[3] & turnoX & ~ocupada[3]    )
			begin
					nextState=revisar_ganador_X;
					x[3]=1;
			end
			else if(cuadro[3] & ~turnoX  & ~ocupada[3]    )
			begin
					nextState=revisar_ganador_O;
					o[3]=1;
			end
			else if(cuadro[4] & turnoX & ~ocupada[4]    )
			begin
					nextState=revisar_ganador_X;
					x[4]=1;
			end
			else if(cuadro[4] & ~turnoX  & ~ocupada[4]   )
			begin
					nextState=revisar_ganador_O;
					o[4]=1;
			end
			else if(cuadro[5] & turnoX & ~ocupada[5]   )
			begin
					nextState=revisar_ganador_X;
					x[5]=1;
			end
			else if(cuadro[5] & ~turnoX  & ~ocupada[5]   )
			begin
					nextState=revisar_ganador_O;
					o[5]=1;
			end
			else if(cuadro[6] & turnoX & ~ocupada[6]    )
			begin
					nextState=revisar_ganador_X;
					x[6]=1;
			end
			else if(cuadro[6] & ~turnoX  & ~ocupada[6]   )
			begin
					nextState=revisar_ganador_O;
					o[6]=1;
			end
			else if(cuadro[7] & turnoX & ~ocupada[7]    )
			begin
					nextState=revisar_ganador_X;
					x[7]=1;
			end
			else if(cuadro[7] & ~turnoX  & ~ocupada[7]    )
			begin
					nextState=revisar_ganador_O;
					o[7]=1;
			end
			else if(cuadro[8] & turnoX & ~ocupada[8]    )
			begin
					nextState=revisar_ganador_X;
					x[8]=1;
			end
			else if(cuadro[8] & ~turnoX  & ~ocupada[8]  ) 
			begin
					nextState=revisar_ganador_O;
					o[8]=1;
			end
			else 
				nextState= retorno;
			end
			revisar_ganador_O://--------------------
			begin
			turnoX=~turnoX;
			ocupada = o|x; 
			if(GanoO)
			begin
				inc_o_score=1;
				displayGanadorO=1;
				nextState=espera;
			end
			else if(Empate)
			begin
				displayEmpate=1;
				nextState=espera;
			end
			else if(~GanoO & ~Empate)
				nextState=r;
			
			end
			revisar_ganador_X://--------------------
			begin
				turnoX=~turnoX;
				ocupada = o|x; 
				if(GanoX)
				begin
					inc_x_score=1;
					displayGanadorX=1;
					nextState=espera;
				end
				else if(Empate)
				begin
					displayEmpate=1;
					nextState=espera;
				end
				else if(~GanoX & ~Empate)
					nextState=r;
			end
			espera://--------------------
			begin
			if(randomClick)
			begin
				nextState=inicio;
				o=4'b0;
				x=4'b0;
			end
			else
				nextState=espera;
			end
			r://------------------------------------
			begin
				if(restart)
				begin
					resetScore=1;
					o=4'b0;
					x=4'b0;
					nextState= inicio;
				end
				else
					nextState= e;
			end
			e://------------------------------------
			begin
				nextState=retorno;
				if(erase)
					resetScore=1;		
			end
			retorno: //-----------------------------
			begin
				resetScore=0;
				if(click)
					nextState=verposicion;
				else
					nextState=r;
			end
			default://------------------------------
			begin
				nextState=inicio;
			end
				
		
		endcase
	end
	
always @(posedge clk_100MHz )
	state<= nextState;
endmodule