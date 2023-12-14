`timescale 1ns/1ns
module Shifter( Signal,dataA, dataB, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;
wire [31:0] a , b ,c , d ,e ,out ;
reg [31:0] temp ;

parameter SLL = 6'b000000;


assign a = dataB[0]? {dataA[30:0], 1'b0 } : dataA ;
assign b = dataB[1]? {dataA[29:0], 2'b0 } : a ;
assign c = dataB[2]? {dataA[27:0], 4'b0 } : b ;
assign d = dataB[3]? {dataA[23:0], 8'b0 } : c ;
assign e = dataB[4]? {dataA[15:0], 16'b0 } : d ;
assign out = reset|dataB[31:5]? 32'b0 : e ;
assign dataOut = out  ;


endmodule
