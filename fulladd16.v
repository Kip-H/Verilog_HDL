module fulladd16 (
        sum, 
       c_out,
         a, 
         b, 
         c_in
);
output[15:0] sum;  
output c_out;
input [15:0] a;
input [15:0] b; 
input c_in;
wire  c_out_0; 
wire  c_out_1;
wire  c_out_2;

fulladd4 u_fulladd4_0( 
           sum[3:0], 
           c_out_0, 
           a[3:0], 
           b[3:0], 
            c_in
);
fulladd4 u_fulladd4_1(
         .sum(sum[7:4]), 
         .c_out(c_out_1), 
         .a(a[7:4]), 
         .b(b[7:4]), 
         .c_in(c_out_0)
);
fulladd4 u_fulladd4_2(
         .a(a[11:8]), 
         .b(b[11:8]), 
         .c_in(c_out_1), 
         .sum(sum[11:8]), 
         .c_out(c_out_2)
);
fulladd4 u_fulladd4_3(
          .a(a[15:12]), 
          .b(b[15:12]), 
          .c_in(c_out_2), 
          .sum(sum[15:12]), 
          .c_out(c_out)

);
endmodule

