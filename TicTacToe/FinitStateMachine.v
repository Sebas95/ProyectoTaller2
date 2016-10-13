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
		output reg [8:0]x=0,
		output reg [8:0]o=0,
		output reg resetScore=0,
		output reg inc_x_score=0,
		output reg inc_o_score=0,
		output reg displayStartPlaying=0,
		output reg displayGanadorX=0,
		output reg displayGanadorO=0,
		output reg turnoX = 1,
		output reg [3:0]state =0
		
    );
	 
	 
	 reg [3:0] nextState = 4'b0000;
	 //Estados disponibles de la maquina de estados con sus valores respectivos
	 localparam [3:0] inicio = 				4'b0000; //0
	 localparam [3:0] cero_0 = 				4'b0001;
	 localparam [3:0] cero_1 = 				4'b0010;
	 localparam [3:0] cero_2 = 				4'b0011;
	 localparam [3:0] uno_0 = 					4'b0100;
	 localparam [3:0] uno_1 = 					4'b0101;
	 localparam [3:0] uno_2 = 					4'b0110;
	 localparam [3:0] dos_0 = 					4'b0111;
	 localparam [3:0] dos_1 = 					4'b1000;
	 localparam [3:0] dos_2 = 					4'b1001;
	 localparam [3:0] revisar_ganador_O = 	4'b1010;
	 localparam [3:0] revisar_ganador_X = 	4'b1011; //11
	 localparam [3:0] r = 						4'b1100; //12
	 localparam [3:0] e =						4'b1101; //13
	 localparam [3:0] retorno =			   4'b1110; //14
	 ///variables locales
	wire click = cuadro[0]|cuadro[1]|cuadro[2]|cuadro[3]|cuadro[4]|cuadro[5]|cuadro[6]|cuadro[7]|cuadro[8];
	wire GanoX= (x[0]&x[1]&x[2])|(x[3]&x[4]&x[5])|(x[6]&x[7]&x[8])|
					(x[0]&x[3]&x[6])|(x[1]&x[4]&x[7])|(x[2]&x[5]&x[8])|
					(x[0]&x[4]&x[8])|(x[2]&x[4]&x[6]);
					
	wire GanoO= (o[0]&o[1]&o[2])|(o[3]&o[4]&o[5])|(o[6]&o[7]&o[8])|
					(o[0]&o[3]&o[6])|(o[1]&o[4]&o[7])|(o[2]&o[5]&o[8])|
					(o[0]&o[4]&o[8])|(o[2]&o[4]&o[6]);
	
	
	always @*
	begin
		case (state)
		
			inicio://--------------------------------
			begin
				displayStartPlaying=1;
				inc_x_score=0;
				inc_o_score=0;
				displayGanadorX=0;
				displayGanadorO=0;
				resetScore=0;
				if(click)
					nextState=cero_0;
				else
					nextState=inicio;
			end
			cero_0://--------------------------------
			begin
				displayStartPlaying=0;
				if(cuadro[0] & turnoX & ~o[0] & ~x[0])
				begin
					nextState=revisar_ganador_X;
					x[0]=1;
				end
				else if(cuadro[0] & ~turnoX & ~o[0] & ~x[0])
				begin
					nextState=revisar_ganador_O;
					o[0]=1;
				end 
				else if(~cuadro[0])
					nextState=cero_1;
			end
			cero_1://--------------------------------
			begin				
				if(cuadro[1] & turnoX & ~o[1] & ~x[1])
				begin
					nextState=revisar_ganador_X;
					x[1]=1;
				end
				else if(cuadro[1] & ~turnoX & ~o[1] & ~x[1])
				begin
					nextState=revisar_ganador_O;
					o[1]=1;
				end 
				else if(~cuadro[1])
					nextState=cero_2;
			end
			cero_2://--------------------------------
			begin				
				if(cuadro[2] & turnoX& ~o[2] & ~x[2])
				begin
					nextState=revisar_ganador_X;
					x[2]=1;
				end
				else if(cuadro[2] & ~turnoX & ~o[2] & ~x[2])
				begin
					nextState=revisar_ganador_O;
					o[2]=1;
				end 
				else if(~cuadro[2])
					nextState=uno_0;
			
			end
			uno_0://--------------------------------
			begin				
				if(cuadro[3] & turnoX & ~o[3] & ~x[3])
				begin
					nextState=revisar_ganador_X;
					x[3]=1;
				end
				else if(cuadro[3] & ~turnoX & ~o[3] & ~x[3])
				begin
					nextState=revisar_ganador_O;
					o[3]=1;
				end 
				else if(~cuadro[3])
					nextState=uno_1;
			
			end
			uno_1://--------------------------------
			begin				
			if(cuadro[4] & turnoX & ~o[4] & ~x[4])
				begin
					nextState=revisar_ganador_X;
					x[4]=1;
				end
				else if(cuadro[4] & ~turnoX & ~o[4] & ~x[4])
				begin
					nextState=revisar_ganador_O;
					o[4]=1;
				end 
				else if(~cuadro[4])
					nextState=uno_2;
			end
			uno_2://--------------------------------
			begin
				if(cuadro[5] & turnoX & ~o[5] & ~x[5])
				begin
					nextState=revisar_ganador_X;
					x[5]=1;
				end
				else if(cuadro[5] & ~turnoX  & ~o[5] & ~x[5])
				begin
					nextState=revisar_ganador_O;
					o[5]=1;
				end 
				else if(~cuadro[5])
					nextState=dos_0;
			
			end
			dos_0://--------------------------------
			begin
				if(cuadro[6] & turnoX  & ~o[6] & ~x[6])
				begin
					nextState=revisar_ganador_X;
					x[6]=1;
				end
				else if(cuadro[6] & ~turnoX & ~o[6] & ~x[6])
				begin
					nextState=revisar_ganador_O;
					o[6]=1;
				end 
				else if(~cuadro[6])
					nextState=dos_1;
			
			end
			dos_1://--------------------------------
			begin
				if(cuadro[7] & turnoX & ~o[7] & ~x[7])
				begin
					nextState=revisar_ganador_X;
					x[7]=1;
				end
				else if(cuadro[7] & ~turnoX  & ~o[7] & ~x[7])
				begin
					nextState=revisar_ganador_O;
					o[7]=1;
				end 
				else if(~cuadro[7])
					nextState= dos_2;
			
			end
			dos_2://--------------------------------
			begin
				if(cuadro[8] & turnoX  & ~o[8] & ~x[8])
				begin
					nextState=revisar_ganador_X;
					x[8]=1;
				end
				else if(cuadro[8] & ~turnoX & ~o[8] & ~x[8])
				begin
					nextState=revisar_ganador_O;
					o[8]=1;
				end 
				else if(~cuadro[8])
					nextState= retorno;
			end
			revisar_ganador_O://--------------------
			begin
			turnoX=~turnoX;
			if(GanoO)
			begin
				inc_o_score=1;
				displayGanadorO=1;
				nextState=inicio;
			end
			else
				nextState=r;
			
			end
			revisar_ganador_X://--------------------
			begin
				turnoX=~turnoX;
				if(GanoX)
				begin
					inc_x_score=1;
					displayGanadorX=1;
					nextState=inicio;
				end
				else
					nextState=r;
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
					nextState=cero_0;
				else
					nextState=r;
			end
			default://------------------------------
			begin
				nextState=inicio;
			end
				
		
		endcase
	end
	
	always @(posedge clk_100MHz)
		state<=nextState;
endmodule
