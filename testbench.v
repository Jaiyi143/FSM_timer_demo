// testbench for seq_0110
module testbench;
  // tb signals
  reg in;
  reg rst_n;
  reg clk_in;
  wire clk_led;
  wire out;
  wire [0:6] hex;

  // instantiate top level module
  top_seq_0110 seqnon(
    .out(out), 
    .hex(hex), 
    .clk_led(clk_led), 
    .clk_in(clk_in),
    .rst_n(rst_n), 
    .in(in)
  );
 	
  initial clk_in = 0;
  always #1 clk_in = ~clk_in;

  // apply stimuli
initial begin 
  rst_n = 0; in = 0; #12;
  rst_n = 1; in = 0; #4;
  rst_n = 1; in = 1; #4;  
  rst_n = 1; in = 1; #4; 
  rst_n = 1; in = 0; #4;
  rst_n = 1; in = 0; #4;
  rst_n = 1; in = 1; #4;
  rst_n = 1; in = 1; #4;
  rst_n = 1; in = 0; #4;  
  
  
 end
endmodule