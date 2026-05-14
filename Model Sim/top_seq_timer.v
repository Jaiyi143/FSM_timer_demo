//top level design seq 0110 with 7-segment display
module top_seq_timer (out, hex_timer, hex_state, clk_led, clk_in, rst_n, ovr);

// ports
input        ovr;
input        rst_n;
input        clk_in;
output       clk_led;
output       out;
output [0:6] hex_timer;
output [0:6] hex_state;

// nets
wire clk_w;
wire [3:0] state_w;
wire [3:0] timer_w;

// clock divider instance
clk_div #(.PERIOD_OUT(1)) clk_div_ins(
    .clk_in(clk_in),
    .clk_out(clk_w),
    .clk_led(clk_led)
);

// seq instance
timer_seq timer(
    .out(out),
    .state(state_w),
    .ovr(ovr),
    .clk(clk_w),
    .rst_n(rst_n),
    .timer(timer_w)
);

// 7-segment instance for timer
bcd_7seg seg7_timer(
    .hex(hex_timer),
    .bcd(timer_w)
);

// 7-segment instance for state
bcd_7seg seg7_state(
    .hex(hex_state),
    .bcd(state_w)
);

endmodule