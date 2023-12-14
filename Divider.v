`timescale 1ns/1ns
module Divider( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [63:0] dataOut ;


//   Signal ( 6-bits)?
//   DIVU  : 27
reg [63:0] dataOut ;
reg [31:0]A,B ;
reg [63:0] temp, REM ;
reg [31:0] DIVR ;
reg [5:0]count ;
parameter DIVU = 6'b011011;
parameter OUT = 6'b111111;

always@( posedge clk or reset  )
begin
        if ( reset )
        begin
                count = 6'd0 ;
		REM = 64'b0 ;
        end
        else
        begin
		case ( Signal )
  		DIVU: begin
			if ( count != 6'd33 ) begin
				REM[63:32] = REM[63:32] - DIVR[31:0] ;
				if( REM[63] == 1'b0 ) begin 
					REM = REM << 1;
					REM[0] = 1'b1 ;
				end
				else begin	
					REM[63:32] = REM[63:32] + DIVR[31:0] ;
					REM = REM << 1;
					REM[0] = 1'b0 ;
				end
				count = count + 1 ;
				if ( count == 6'd33 ) begin
					A = REM[63:32] ;
					B = REM[31:0] ;
					A = A >> 1 ;
					REM[63:32] = A ;
					REM[31:0] = B ;
				end
			end	
		end
  		OUT:begin
			dataOut = REM ;

		end
		default : begin 
			REM[31:0] = dataA ;
			DIVR[31:0] = dataB ;
			REM = REM << 1 ;
			count = 1 ;
		end
		endcase	
        end

end

endmodule
