//top level design seq 0110 with 7-segment display
module top_seq_timer (out, hex, clk_led, clk_in, rst_n, t,ovr,timer);

// ports
input 		 t;
input        ovr;
input 		 rst_n;
input 		 clk_in;
output 		 clk_led;
output  [3:0] timer;
output 		 out;
output [0:6] hex;

// nets
wire clk_w;
wire [3:0] state_w;

// clock divider instance
clk_div #(.PERIOD_OUT(3)) clk_div_ins(
    .clk_in(clk_in),
    .clk_out(clk_w),
    .clk_led(clk_led)
);

// seq instance
timer_seq seq0110(
    .out(out),
    .state(state_w),
    .t(t),
	 .ovr(ovr),
    .clk(clk_w),
    .rst_n(rst_n)
);

// 7-segment instance
bcd_7seg seg7(
    .hex(hex),
    .bcd(state_w)
);

endmodule