module det_011_reset_mealy(
    clk,
    n_rst,
    din,
    dout
);

input clk;
input n_rst;
input din;
output dout;
reg dout;

parameter S_0 = 3'h0;
parameter S_1 = 3'h1;
parameter S_2 = 3'h2;
parameter S_3 = 3'h3;
parameter S_4 = 3'h4;

reg [2:0] c_state, n_state;
always @(posedge clk or negedge n_rst)
    if(!n_rst)
        c_state <= S_0;
    else
        c_state <= n_state;

always @(c_state or din)
    case(c_state)
        S_0 : begin
            n_state = (din == 1'b0) ? S_1 : S_3;
            dout = 1'b0;
        end

        S_1 : begin
            n_state = (din == 1'b1) ? S_2 : S_4;
            dout = 1'b0;
        end

        S_2 : begin
            n_state = S_0;
            dout = (din == 1'b1) ? 1'b1 : 1'b0;
        end

        S_3 : begin
            n_state = S_4;
            dout = 1'b0;
        end

        S_4 : begin
            n_state = S_0;
            dout = 1'b0;
        end

        default : begin
            n_state = S_0;
            dout = 1'b0;
        end
    endcase
endmodule
