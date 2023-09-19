//syntax error, Run-time error
module fulladd4 (
	sum, 
	c_out, 
	a, 
	b, 
	c_in
);

output [3:0] sum;   
output        c_out;
input  [3:0] a;
input  [3:0] b;     
input         c_in;

assign {c_out,sum} = {1'b0,a} + {1'b0,b} + {4'h0,c_in};

endmodule

