module TOP(
din,
clk,
n_rst,
load,
send,
dout,
dout_vld);

input [3:0] din;
input load;
input send;
input clk;
input n_rst;

output [3:0] dout;
output dout_vld;
wire data;
wire vld;

P2S u_p2s(
   .clk(clk),
   .n_rst(n_rst),
   .load(load),
   .send(send),
   .din(din),
   .vld(vld),
   .data(data)
   );
  
S2P u_s2p(
   .clk(clk),
   .n_rst(n_rst),
   .vld(vld),
   .data(data),
   .dout(dout),
   .dout_vld(dout_vld)
);
endmodule