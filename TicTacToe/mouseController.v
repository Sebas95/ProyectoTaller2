`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:53 10/22/2016 
// Design Name: 
// Module Name:    mouseController 
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
module mouseController(
		input wire clk, reset,
		inout wire ps2d, ps2c,
		output reg [9:0] posX,
		output reg [8:0] posY,
		output wire [2:0] buttons,
		output reg entro
    );

    wire [8:0] xm; //[7:0] magnitud de la velocidad, [8] direcion
	 wire [8:0] ym; //[7:0] magnitud de la velocidad, [8] direcion
	 wire [7:0] movimientoX; //cantidad de pixeles que debe moverse el puntero
	 wire [5:0] movimientoY; //cantidad de pixeles que debe moverse el puntero
    wire m_done_tick;
		
	 mouse mouse_unit
		(.clk(clk), .reset(reset), .ps2d(ps2d), .ps2c(ps2c),
		.xm(xm),.ym(ym),.btnm(buttons),.m_done_tick(m_done_tick));
		 
	 initial begin
		posX = 10'd20;
		posY = 9'd240;
		entro = 0;
	 end
	 
	 //logica de movimiento en X
	 always@(posedge clk)begin
		if (m_done_tick) begin
			if (~xm[8]) begin				
				if (posX < 10'd640 - 10) begin
					if(movimientoX[7:0] < 8)
						posX = posX + 2;
					else if((movimientoX > 8) && movimientoX < 64)
						posX = posX + 5;
					else if((movimientoX > 64) && movimientoX < 256)
						posX = posX + 10;						
				end else begin
					if(xm[8])
						posX = 10'b0;
					else
						posX = 10'd630;
				end
			end else begin //xm[8]
				if (posX > 10'b0) begin
					if(movimientoX[7:0] < 8)
						posX = posX - 2;
					else if((movimientoX > 8) && movimientoX < 64)
						posX = posX - 5;
					else if((movimientoX > 64) && movimientoX < 256)
						posX = posX - 10;							
				end else begin
					posX = 10'b0;
				end
			end //xm[8]
		end //m_done_tick
	 end 

	 
	 //logica de movimiento en y
	 always@(posedge clk)begin
		if (m_done_tick) begin
			if (~ym[8]) begin
				if (posY > 9'd15) begin
					//entro = 1;
					posY = posY - 2;
				end else begin
					//entro = 0;
					posY = posY;
				end
			end else begin //ym[8]
				if (posY < 475) begin
					posY = posY + 2;
				end else begin
					posY = posY;
				end
			end //ym[8]
		end //m_done_tick
	 end
	 
	 reg [7:0] movimientoXAux = 0;
	 reg [7:0] movimientoYAux = 0;
	 
	 always@*
		begin
			if(xm[8] && ~buttons)
				begin 
					movimientoXAux = xm[7:0] - 1;
					movimientoXAux = ~movimientoXAux;
				end
			else
				if(~buttons)
					movimientoXAux = xm[7:0];
		end
			 
	 assign movimientoX = movimientoXAux;
	 assign movimientoY = ym[5:0];
endmodule