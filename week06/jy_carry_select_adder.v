module jy_carry_select_adder(
  din_a,
  din_b,
  cin,
  sum,
  cout
);
input   [7:0] din_a;
input   [7:0] din_b;
input         cin;
output  [7:0] sum;
output reg cout;

wire carry_1;
wire carry_2;
reg  carry_3;


wire [1:0] sum_1;
wire [1:0] sum_2;
reg  [1:0] sum_3;
reg  [1:0] sum_4;


// assign 1 
assign {carry_1,sum_1} = {1'h0,din_a[1:0]} + {1'h0,din_b[1:0]} + {2'h0,cin};

// assign 2
assign {carry_2,sum_2} = (carry_1==1'b1)?  {1'h0,din_a[3:2]} + {1'h0,din_b[3:2]} + 3'b001:
                                           {1'h0,din_a[3:2]} + {1'h0,din_b[3:2]} + 3'b000;

// always 3
always @(carry_2 or din_a or din_b)
    begin
        if(carry_2==0)
            {carry_3, sum_3} = din_a[5:4] + din_b[5:4] + 3'b000;
        else
            {carry_3, sum_3} = din_a[5:4] + din_b[5:4] + 3'b001;
    end

// always 4
always @(carry_3 or din_a or din_b)
    begin
        case(carry_3)
            2'h0: {cout, sum_4} = din_a[7:6] + din_b[7:6] + 3'b000;
            2'h1: {cout, sum_4} = din_a[7:6] + din_b[7:6] + 3'b001;
            default: {cout, sum_4} = din_a[7:6] + din_b[7:6] + 3'b000;
        endcase
    end
    
assign sum ={sum_4,sum_3,sum_2,sum_1};

endmodule