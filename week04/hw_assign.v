module hw_assign(
    input [2:0] din0,
    input [2:0] din1,
    input [1:0] sel,
    output [2:0] dout
);

assign dout = (sel == 2'b00) ? (din0 + din1):
              (sel == 2'b01) ? (din0 + ((~din1)+2'b01)):
              (sel == 2'b10) ? (din0 & din1):
              {1'b0,din0[2:1]};
endmodule