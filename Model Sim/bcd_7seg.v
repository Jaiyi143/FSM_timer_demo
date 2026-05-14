/*======================================================
 BINARY-CODED-DECIMAL TO 7-SEGMENT COMMON-ANODE DISPLAY
========================================================
Description:
 This module takes 4-bit decimal value and translate
 it in a 7-segment common-anode display.


*/


module bcd_7seg(hex,bcd);
	//ports and nets

	input [3:0] bcd;
	output reg [0:6] hex;



	always@(bcd) begin 
	case (bcd)
	4'd0: hex = 7'b1111110;// ^ 7'b1111111 ;
4'd1: hex = 7'b0110000;// ^ 7'b1111111;
4'd2: hex = 7'b1101101;// ^ 7'b1111111;
4'd3: hex = 7'b1111001;// ^ 7'b1111111;
default : hex = 7'b0000001;// ^ 7'b1111111;
	

	


endcase
end
endmodule
