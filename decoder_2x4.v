module decoder_2x4(
  en,
  din,
  dout
);

input en;
input [1:0] din;
output [3:0] dout;

wire [3:0] dout_i;

assign dout_i = (din == 2'b00)? 4'b0001 : 
(din == 2'b01)? 4'b0010 :
(din == 2'b10)? 4'b0100 : 
// ;?? :? ??? ????.
4'b1000;

//always ?? assign?? ????.
assign dout = (en == 1'b1) ? dout_i : 4'b0000;
  
endmodule