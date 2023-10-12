module carry_select_adder(
    input reg[7:0] din_a,
    input reg[7:0] din_b,
    input wire cin,
    output [7:0] sum,
    output reg cout
);
wire sel;
wire sel_1;
reg sel_2;

reg [1:0] sum_1;
reg [1:0] sum_2;


assign {sel, sum[1:0]} = din_a[1:0] + din_b[1:0] + cin;
// assign과 삼항 연산자
assign {sel_1, sum[3:2]} = (sel == 2'h0) ? (din_a[3:2] + din_b[3:2] + 2'h0) 
                                                : din_a[3:2] + din_b[3:2] + 2'h1;

//always, if-else문 사용
always @(sel_1 or din_a or din_b)
    begin
        if(sel_1 == 0)
            {sel_2, sum_1} = din_a[5:4] + din_b[5:4] + 2'h0;
        else
            {sel_2, sum_1} = din_a[5:4] + din_b[5:4] + 2'h1;
    end

//always, case문 사용
always @(sel_2 or din_a or din_b)
    begin
        case(sel_2)
            2'h0: {cout, sum_2} = din_a[7:6] + din_b[7:6] + 2'h0;
            2'h1: {cout, sum_2} = din_a[7:6] + din_b[7:6] + 2'h1;
            default: {cout, sum_2} = din_a[7:6] + din_b[7:6] + 2'h0;
        endcase
    end
assign sum[5:4] = sum_1;
assign sum[7:6] = sum_2;
endmodule