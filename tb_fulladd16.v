`timescale 1ns/100ps

module tb_fulladd16;

reg [15:0]  a;
reg [15:0]  b;
reg           c_in;
wire [15:0] sum;
wire          c_out;

fulladd16 u_fulladd16 (
    .sum(sum), 
    .c_out(c_out), 
    .a(a), 
    .b(b), 
    .c_in(c_in)
);

integer i, j, k;        
initial begin
    a = 16'h0; 
    b = 16'h0;
    c_in = 1'b0;
    for (i=0;i<16;i=i+1) begin
        for (j=0;j<16;j=j+1) begin
            for (k=0;k<2;k=k+1) begin
                #5 a = i; 
                     b = j; 
                     c_in = k;
            end
    end
    #5 $stop;
end
end
  initial begin
    $monitor(" %d + %d + %d = %d", a, b, c_in, sum);
  end

endmodule
