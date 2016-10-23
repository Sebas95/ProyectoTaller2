`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:39 09/09/2016 
// Design Name: 
// Module Name:    TwoDigitDeco 
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
module TwoDigitDeco(
		input clk, //reloj
		input [5:0]number, //numero de 6 bit
		output reg [3:0]decimals, //decenas
		output reg [3:0] units //unidades
    );
	 
	 //aquí se decodifica
	 always @(posedge clk)
	 begin	
		case (number) //pregunta que numero de 6 bits le entra
         6'b000000: //00
			begin
				units <=		 4'b0000;
				decimals <=  4'b0000;
			end
         6'b000001: //01
			begin
				units <=		4'b0001;
				decimals <= 4'b0000;
			end
			6'b000010: //02
			begin
				units <=		4'b0010;
				decimals <= 4'b0000;
			end
			6'b000011: //03
			begin
				units <=		4'b0011;
				decimals <= 4'b0000;
			end
			6'b000100: //04
			begin
				units <=		4'b0100;
				decimals <= 4'b0000;
				end
			6'b000101: //05
			begin
				units <=		4'b0101;
				decimals <= 4'b0000;
				end
			6'b000110: //06
			begin
				units <=		4'b0110;
				decimals <= 4'b0000;
				end
			6'b000111: //07
			begin
				units <=		4'b0111;
				decimals <= 4'b0000;
				end
			6'b001000: //08
			begin
				units <=		4'b1000;
				decimals <= 4'b0000;
				end
			6'b001001: //09
			begin
				units <=		4'b1001;
				decimals <= 4'b0000;
				end
			6'b001010: //10
			begin
				units <=		4'b0000;
				decimals <=	4'b0001;
				end
			6'b001011: //11
			begin
				units <=		4'b0001;
				decimals <=	4'b0001;
				end
			6'b001100: //12
			begin
				units <=		4'b0010;
				decimals <= 4'b0001;
				end
			6'b001101: //13
			begin
				units <= 	4'b0011;
				decimals <=	4'b0001;
				end
			6'b001110: //14
			begin
				units <= 	4'b0100;
				decimals <=	4'b0001;
				end
			6'b001111: //15
			begin
				units <= 	4'b0101;
				decimals <=	4'b0001;
				end
			6'b010000: //16
			begin
				units <= 	4'b0110;
				decimals <=	4'b0001;
				end
         6'b010001: //17
			begin
				units <= 	4'b0111;
				decimals <=	4'b0001;
				end
			6'b010010: //18
			begin
				units <= 	4'b1000;
				decimals <=	4'b0001;
				end
			6'b010011: //19
			begin
				units <= 	4'b1001;
				decimals <=	4'b0001;
				end
			6'b010100: //20
			begin
				units <= 	4'b0000;
				decimals <=	4'b0010;
				end
			6'b010101: //21
			begin
				units <= 	4'b0001;
				decimals <=	4'b0010;
				end
			6'b010110: //22
			begin
				units <= 	4'b0010;
				decimals <=	4'b0010;
				end
			6'b010111: //23
			begin
				units <= 	4'b0011;
				decimals <=	4'b0010;
				end
			6'b011000: //24
			begin
				units <= 	4'b0100;
				decimals <=	4'b0010;
				end
			6'b011001: //25
			begin
				units <= 	4'b0101;
				decimals <=	4'b0010;
				end
			6'b011010: //26
			begin
				units <= 	4'b0110;
				decimals <=	4'b0010;
				end
			6'b011011: //27
			begin
				units <= 	4'b0111;
				decimals <=	4'b0010;
				end
			6'b011100: //28
			begin
				units <= 	4'b1000;
				decimals <=	4'b0010;
				end
			6'b011101: //29
			begin
				units <= 	4'b1001;
				decimals <=	4'b0010;
				end
			6'b011110: //30
			begin
				units <= 	4'b0000;
				decimals <=	4'b0011;
				end
			6'b011111: //31
			begin
				units <= 	4'b0001;
				decimals <=	4'b0011;
				end
			6'b100000: //32
			begin
				units <= 	4'b0010;
				decimals <=	4'b0011;
				end
         6'b100001: //33
			begin
				units <= 	4'b0011;
				decimals <=	4'b0011;
				end
			6'b100010: //34
			begin
				units <= 	4'b0100;
				decimals <=	4'b0011;
				end
			6'b100011: //35
			begin
				units <= 	4'b0101;
				decimals <=	4'b0011;
				end
			6'b100100: //36
			begin
				units <= 	4'b0110;
				decimals <=	4'b0011;
				end
			6'b100101: //37
			begin
				units <= 	4'b0111;
				decimals <=	4'b0011;
				end
			6'b100110: //38
			begin
				units <= 	4'b1000;
				decimals <=	4'b0011;
				end
			6'b100111: //39
			begin
				units <= 	4'b1001;
				decimals <=	4'b0011;
				end
			6'b101000: //40
			begin
				units <= 	4'b0000;
				decimals <=	4'b0100;
			end
			6'b101001: //41
			begin
				units <= 	4'b0001;
				decimals <=	4'b0100;
				end
			6'b101010: //42
			begin
				units <= 	4'b0010;
				decimals <=	4'b0100;
				end
			6'b101011: //43
			begin
				units <= 	4'b0011;
				decimals <=	4'b0100;
				end
			6'b101100: //44
			begin
				units <= 	4'b0100;
				decimals <=	4'b0100;
				end
			6'b101101: //45
			begin
				units <= 	4'b0101;
				decimals <=	4'b0100;
				end
			6'b101110: //46
			begin
				units <= 	4'b0110;
				decimals <=	4'b0100;
				end
			6'b101111: //47
			begin
				units <= 	4'b0111;
				decimals <=	4'b0100;
				end
			6'b110000: //48
			begin
				units <= 	4'b1000;
				decimals <=	4'b0100;
				end
         6'b110001: //49
			begin
				units <= 	4'b1001;
				decimals <=	4'b0100;
				end
			6'b110010: //50
			begin
				units <= 	4'b0000;
				decimals <=	4'b0101;
				end
			6'b110011: //51
			begin
				units <= 	4'b0001;
				decimals <=	4'b0101;
				end
			6'b110100: //52
			begin
				units <= 	4'b0010;
				decimals <=	4'b0101;
				end
			6'b110101: //53
			begin
				units <= 	4'b0011;
				decimals <=	4'b0101;
				end
			6'b110110: //54
			begin
				units <= 	4'b0100;
				decimals <=	4'b0101;
			end
			6'b110111: //55
			begin
				units <= 	4'b0101;
				decimals <=	4'b0101;
			end
			6'b111000: //56
			begin
				units <= 	4'b0110;
				decimals <=	4'b0101;
			end
			6'b111001: //57
			begin
				units <= 	4'b0111;
				decimals <=	4'b0101;
			end
			6'b111010: //58
			begin
				units <= 	4'b1000;
				decimals <=	4'b0101;
			end
			6'b111011: //59
			begin
				units <= 	4'b1001;
				decimals <=	4'b0101;
			end
         default:
			begin			
				units <= 	4'b1111; 
				decimals <=	4'b1111;
			end
      endcase
		
		
	 end


endmodule
