/*=======================================================================================
                                    CLOCK DIVIDER
=========================================================================================
Description: 
    This module takes a high-frequency input clock (clk_in) and divides it down to a 
    lower frequency. By default, it divides a 50MHz input clock down to 1s clock period, 
    toggling the outputs every 25,000,000 ticks.

Design Engineer:
    Gomez,Sergie D.

Date:
    30 Mar 2026
----------------------------------------------------------------------------------------*/
module clk_div(clk_out,clk_led,clk_in);
// ports
input       clk_in;
output  reg clk_out = 0;
output  reg clk_led = 0;

// Division Factor
parameter   integer   FREQ_IN       = 50_000_000;               // 50MHz
parameter   integer   PERIOD_OUT    = 1;                        // 1s
localparam  integer   TICKS         = (FREQ_IN*PERIOD_OUT)/2;   // Number of ticks every half-cycle

// Clock Generator
integer tick_cnt = 0;

always @(posedge clk_in) begin
    if(tick_cnt == TICKS-1) begin
        clk_out  <= ~clk_out;       // toggle output
        clk_led  <= ~clk_led;       // toggle led
        tick_cnt <= 0;              // reset tick counter
    end
    else tick_cnt <= tick_cnt + 1;  // increment tick counter
end
endmodule