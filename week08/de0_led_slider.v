module de0_led_slider(
    din,
    dout,
    fnd_30_out,
    fnd_74_out
);

input [3:0] din;
output [7:0] dout;
output [6:0] fnd_30_out;
output [6:0] fnd_74_out;

assign dout[3:0] = din;
assign dout[7:4] = {2'b0, din[1:0]} + {2'b0, din[3:2]};

FND u_FND_01(
    .din(dout[3:0]),
    .dout(fnd_30_out)
);

FND u_FND_02(
    .din(dout[7:4]),
    .dout(fnd_74_out)
);
endmodule