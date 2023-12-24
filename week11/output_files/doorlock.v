module doorlock(
    clk,
    n_rst,
    start,
    bt_0,
    bt_1,
    bt_2,
 

    led_0,
    led_1,
    led_2,
    led_ok,
    led_fail
);

input clk;
input n_rst;
input start;
input bt_0;
input bt_1;
input bt_2;

output led_0;
output led_1;
output led_2;



output led_ok;
output led_fail;

parameter STOP = 3'h0;
parameter START = 3'h1;
parameter S_1 = 3'h2;
parameter S_2 = 3'h3;
parameter S_3 = 3'h4;
parameter S_4 = 3'h5;

reg [2:0] c_state, n_state;
reg led_0 = 1'b0;
reg led_1 = 1'b0;
reg led_2 = 1'b0;
reg led_ok = 1'b0;
reg led_fail = 1'b0;
reg bt_0d1;
reg bt_1d1;
reg bt_2d1;
reg bt_0d2;
reg bt_1d2;
reg bt_2d2;


always @(posedge clk or negedge n_rst)
    if(!n_rst)
        c_state <= STOP;
    else if (start != 1'b1)
        c_state <= STOP;
    else
        c_state <= n_state;

always @(posedge clk or negedge n_rst)
    if(!n_rst) begin
        bt_0d1 <= 1'b1;
        bt_0d2 <= 1'b1;
        bt_1d1 <= 1'b1;
        bt_1d2 <= 1'b1;
        bt_2d1 <= 1'b1;
        bt_2d2 <= 1'b1;
    end
    else begin
            bt_0d1 <= bt_0;
            bt_0d2 <= bt_0d1;

            bt_1d1 <= bt_1;
            bt_1d2 <= bt_1d1;

            bt_2d1 <= bt_2;
            bt_2d2 <= bt_2d1;
    end

    assign bt_0_on = ((bt_0d1 == 1'b0) && (bt_0d2 == 1'b1)) ? 1'b1 : 1'b0;
    assign bt_1_on = ((bt_1d1 == 1'b0) && (bt_0d2 == 1'b1)) ? 1'b1 : 1'b0;
    assign bt_2_on = ((bt_2d1 == 1'b0) && (bt_0d2 == 1'b1)) ? 1'b1 : 1'b0; 

always @(bt_0_on or bt_1_on or bt_2_on or start)
    begin
        led_0 <= (bt_0_on == 1'h1 && start == 1'h1) ? 1'b1 : (start == 1'h0) ? 1'b0 : led_0;
        led_1 <= (bt_1_on == 1'h1 && start == 1'h1) ? 1'b1 : (start == 1'h0) ? 1'b0 : led_1;
        led_2 <= (bt_2_on == 1'h1 && start == 1'h1) ? 1'b1 : (start == 1'h0) ? 1'b0 : led_2;
    end

// state 변경
always @(c_state or start or bt_0_on or bt_1_on or bt_2_on)
    case(c_state)
        STOP : begin
            n_state = (start == 1'b1) ? START : STOP;
            led_fail = 1'b0;
            led_ok = 1'b0;
        end
        START : begin
                n_state = (bt_2_on == 1'b1) ? S_1 : ((bt_0_on == 1'b0) && (bt_1_on == 1'b0) && (bt_2_on == 1'b0)) ? START : S_3;
                led_fail = 1'b0;
                led_ok = 1'b0;
        end

        S_1 : begin
            n_state = (bt_0_on == 1'b1) ? S_2 : ((bt_0_on == 1'b0) && (bt_1_on == 1'b0) && (bt_2_on == 1'b0)) ? S_1 : S_4;
            led_fail = 1'b0;
            led_ok = 1'b0;
        end

        S_2 : begin
            if (start == 1'b0)
                begin
                    n_state = STOP;
                    led_fail = 1'b0;
                    led_ok = 1'b0;
                end
            else
                begin
                    if ((bt_0_on == 1'b0) && (bt_1_on == 1'b0) && (bt_2_on == 1'b0))
                        begin
                            n_state = c_state;
                        end
                    else
                        begin
                            n_state = c_state;
                            led_fail = 1'b0;
                            led_ok = 1'b1;
                        end
                end             
        end
        S_3 : begin
            n_state = ((bt_0_on == 1'b0) && (bt_1_on == 1'b0) && (bt_2_on == 1'b0)) ? S_3 : S_4;
            led_fail = 1'b0;
            led_ok = 1'b0;
        end

        S_4 : begin
            if (start == 1'b0)
                begin
                    n_state = STOP;
                    led_fail = 1'b0;
                    led_ok = 1'b0;
                end
            else
                begin
                    if ((bt_0_on == 1'b0) && (bt_1_on == 1'b0) && (bt_2_on == 1'b0))
                        begin
                            n_state = c_state;
                        end
                    else
                        begin
                            n_state = c_state;
                            led_fail = 1'b1;
                            led_ok = 1'b0;
                        end
                end    
        end
        default : begin
            n_state = STOP;
        end
    endcase
endmodule
