module counter(
    clk,
    n_rst,
    up,
    counter3,
    counter1
);

input clk;
input n_rst;
input up;
output [1:0] counter3;
output [1:0] counter1;
reg [1:0] cnt_1;
reg [1:0] cnt_3;

always @(posedge clk or negedge n_rst)
    if(!n_rst) begin
        cnt_1 <= 2'h0;
    end
    else begin
        if(cnt_1 != 2'h2)
            cnt_1 <= (up == 1'b1) ? cnt_1 + 2'h1 : cnt_1;
        else if(up == 1'h1 && cnt_1 == 2'h2)
            cnt_1 <= 2'h0;
        else
            cnt_1 <= cnt_1 + 2'h0;
    end
assign counter1 = cnt_1;

always @(posedge clk or negedge n_rst)
    if(!n_rst) begin
        cnt_3 <= 2'h0;
    end
    else begin
        if (cnt_3 != 2'h2)
            cnt_3 <= (cnt_1 == 2'h2 && up == 1'b1) ? cnt_3 + 2'h1 : cnt_3;
        else if(cnt_1 == 2'h2 && cnt_3 == 2'h2 && up == 1'b1)
            cnt_3 <= 2'h0;
        else
            cnt_3 <= cnt_3 + 2'h0;
    end
assign counter3 = cnt_3;
endmodule