`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:24 09/05/2016 
// Design Name: 
// Module Name:    FrecuencyDivider 
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
module FrecuencyDivider(
   clk_100MHz,
	clk_1Hz,
	counter[26:0]
	
	);
	
	//variables
	input clk_100MHz;
	output clk_1Hz;// frecuencua de 1 seg
	output [26:0]counter;
	reg [26:0]counter=0;
	
	
	reg  clk_1Hz=0; //reloj de la FPGA
	  
	always @(posedge clk_100MHz)
	begin 

		if(counter>27'd99999998) //cuenta hasta que transcurra 1 seg
		begin
		counter<=27'b0;
		clk_1Hz<=1; //ciclo positivo
		end 
		else if (counter<27'd50000000) //medio segundo
		begin
			 clk_1Hz<=0; //ciclo negativo
			 counter<=counter + 1; //aumenta contador
		end
		else  
		begin
			clk_1Hz <=1; //ciclo positivo
			counter<=counter + 1; //incrementa contador
		end
		
	end		

	
	
	

endmodule
