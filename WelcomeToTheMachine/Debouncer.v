`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:35:57 09/05/2016 
// Design Name: 
// Module Name:    Debouncer 
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
module Debouncer
	 (
    input wire clk, reset,
    input wire sw, //swith de entrada
    output reg db //salida corregida
   );

   // declaracion de los estados
   localparam  [2:0]
               cero    = 3'b000,
               wait1_1 = 3'b001,
               wait1_2 = 3'b010,
               wait1_3 = 3'b011,
               uno     = 3'b100,
               wait0_1 = 3'b101,
               wait0_2 = 3'b110,
               wait0_3 = 3'b111;

   // number of counter bits (2^N * 20ns = 10ms tick)
   localparam N =19;

   // declaración de variables
   reg [N-1:0] q_reg;
   wire [N-1:0] q_next;
   wire m_tick;
   reg [2:0] state_reg, state_next;

 

  
   // contador para generar el tick de 10 ms 
   always @(posedge clk)
      q_reg <= q_next;
   // next-state logic
   assign q_next = q_reg + 1;
   // output tick
   assign m_tick = (q_reg==0) ? 1'b1 : 1'b0;

 
   // Máquina de estados
  
   // controlador deestados
    always @(posedge clk, posedge reset)
       if (reset)
          state_reg <= cero;
       else
          state_reg <= state_next;

   // logica de transición entre estados
   always @*
   begin
      state_next = state_reg;  // default state: the same
      db = 1'b0;               // default output: 0
      case (state_reg)
         cero:
            if (sw)
               state_next = wait1_1;
         wait1_1:
            if (~sw)
               state_next = cero;
            else
               if (m_tick)
                  state_next = wait1_2;
         wait1_2:
            if (~sw)
               state_next = cero;
            else
               if (m_tick)
                  state_next = wait1_3;
         wait1_3:
            if (~sw)
               state_next = cero;
            else
               if (m_tick)
                  state_next = uno;
         uno:
            begin
              db = 1'b1;
              if (~sw)
                 state_next = wait0_1;
            end
         wait0_1:
            begin
               db = 1'b1;
               if (sw)
                  state_next = uno;
               else
                 if (m_tick)
                    state_next = wait0_2;
            end
         wait0_2:
            begin
               db = 1'b1;
               if (sw)
                  state_next = uno;
               else
                 if (m_tick)
                    state_next = wait0_3;
            end
         wait0_3:
            begin
               db = 1'b1;
               if (sw)
                  state_next = uno;
               else
                 if (m_tick)
                    state_next = cero;
            end
				
				
         default: state_next = cero;
      endcase
		
   end //end delalways 

endmodule