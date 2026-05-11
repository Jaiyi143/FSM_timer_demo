/*==================================
     
====================================
Description:

Design Engineer:
Gomez,Sergie D.

Date:
March 31 2026
----------------------------------*/
module timer_seq(out,state,clk,rst_n,ovr,timer);
// ports
input            clk;
input            rst_n;
input            ovr;
output     [3:0] timer;
output reg       out;
output reg [3:0] state;

// state assignment
parameter [3:0] S0 = 4'b0000;
parameter [3:0] S1 = 4'b0001;
parameter [3:0] S2 = 4'b0010;
parameter [3:0] S3 = 4'b0011;
reg [3:0] nxt_state; // next state
reg [3:0] pre_state; // present state
reg [3:0] t = 4'b0;  // timer counter

// input block
always @(t,pre_state,ovr) begin
    if (ovr) begin
        nxt_state = S3;
    end else begin
        case (pre_state)
            S0: nxt_state = (t==4'd2)? S1:S0;
            S1: nxt_state = (t==4'd3)? S2:S1;
            S2: nxt_state = (t==4'd2)? S0:S2;
            S3: nxt_state = (ovr==0)? S0:S3;
            default: nxt_state = S0;
        endcase
    end
end

// sequential block
always @(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
        pre_state <= S0;
        t         <= 4'b0;
    end
    else if(ovr) begin
        pre_state <= nxt_state;
        t         <= 4'b0;                          
    end
    else begin
        pre_state <= nxt_state;
        // state_timer
        case(pre_state)
            S0: t <= (t==4'd2)? (4'b0):(t + 4'b1);  
            S1: t <= (t==4'd3)? (4'b0):(t + 4'b1);  
            S2: t <= (t==4'd2)? (4'b0):(t + 4'b1);  
            S3: t <= 4'b0;                           
        endcase
    end
end

// output block
always @(pre_state) begin
    case(pre_state)
        S0: begin
                out   = 0;
                state = S0;
            end
        S1: begin
                out   = 1;
                state = S1;
            end
        S2: begin
                out   = 0;
                state = S2;
            end
        S3: begin
                out   = 1;
                state = S3;
            end
        default: begin
                out   = 0;
                state = S0;
            end
    endcase
end

assign timer = t;

endmodule