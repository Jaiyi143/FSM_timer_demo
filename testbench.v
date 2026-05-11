// testbench for seq_0110
module testbench;
  // tb signals
reg        ovr;
reg        rst_n;
reg       clk_in;
wire       clk_led;
wire       out;
wire [0:6] hex_timer;
wire [0:6] hex_state;

  // instantiate top level module
  top_seq_timer seqnon(
    .out(out), 
    .hex_timer(hex_timer), 
    .clk_led(clk_led), 
    .clk_in(clk_in),
    .rst_n(rst_n), 
    .hex_state(hex_state),
    .ovr(ovr)
  );
 	
  initial clk_in = 0;
  always #1 clk_in = ~clk_in;

  // apply stimuli
initial begin 
  rst_n = 0; ovr = 0; #12;
  rst_n = 1; ovr = 0; #4;
  rst_n = 1; ovr = 0; #4;  
  rst_n = 1; ovr = 0; #4; 
  rst_n = 1; ovr = 0; #4;
  rst_n = 1; ovr = 0; #4;
  rst_n = 1; ovr = 1; #4;
  rst_n = 1; ovr = 1; #4;
  rst_n = 1; ovr = 0; #4;  
  
  
 end
endmodule