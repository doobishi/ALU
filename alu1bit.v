module Alu1bit( a, b, INVERTB, cin, SELECT, out, cout  ) ;
	input a, b, INVERTB, cin ;
	output out, cout ;
	input [1:0] SELECT ;
	wire [1:0] SELECT ;
	wire a, b,INVERTB, cin,out, cout ;
	wire temp ;


	// SELECT == 2'b11 || 2'b10
	// assign cout = 1'b0 ;
	assign temp = INVERTB ^ b ;
	// FullAdder fa1( .abit(a), .bbit(temp), .cinbit(cin), .coutbit(cout), .sumbit(out) ) ;
	
	
	
		
	assign out = ( SELECT == 2'b00 ) ? (a & b) :
			( SELECT == 2'b01 ) ? (a || b) :
			( a ^ temp ^ cin ) ;
	assign cout = ( SELECT == 2'b10 ) ? (( a & temp) | (a & cin) | (temp & cin)) :
			( SELECT == 2'b11 ) ? (( a & temp) | (a & cin) | (temp & cin)) :
			1'b0 ;
		      
			
		    
		    
		     
	
endmodule
