`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:07 10/17/2016 
// Design Name: 
// Module Name:    windowsDeco 
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
module screensDeco(
	input wire cePS,
	input wire ceSS,
	input wire [2:0] rgbWS,
	input wire [2:0] rgbPS,
	input wire [10:0] rom_addr_PS,
	input wire [10:0] rom_addr_WS,
	output wire [2:0] rgb,
	output wire [10:0] rom_addr
    );
	 
	reg [2:0] rgbAux = 0;
	reg  [10:0] rom_addr_Aux = 0;
	
	 always @*
		if(ceSS)		
			begin
				rgbAux = rgbWS;
				rom_addr_Aux = rom_addr_WS;
			end
		else if (cePS)
			begin
				rom_addr_Aux = rom_addr_PS;
				rgbAux = rgbPS;
			end
		else
			begin
				rom_addr_Aux = 0;
				rgbAux = 3'b001;
			end

	assign rgb = rgbAux;
	assign rom_addr = rom_addr_Aux;


endmodule
