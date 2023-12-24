`timescale 1ns/1ps
`define T_CLK 10

module TB_P2S_real;

reg clk, n_rst,load,send;
reg [3:0] din;
wire [3:0] dout;
wire vld , data ;
wire dout_vld;
initial begin
  clk= 1'b1;
  n_rst=1'b0;
    
  #(`T_CLK *1.2) n_rst =1'b1;
end
  
always #(`T_CLK/2)clk=~clk;

initial begin
  load=1'b0;
  send=1'b0;
   wait(n_rst==1'b1);
  #(`T_CLK*2)load=1'b1;
  #(`T_CLK*1)load=1'b0;
  #(`T_CLK*1)send=1'b1;
  #(`T_CLK*4)send=1'b0;
  #(`T_CLK*2)load=1'b1;
  #(`T_CLK*1)load=1'b0;
  #(`T_CLK*1)send=1'b1;
  #(`T_CLK*1)send=1'b0;
  #(`T_CLK*1)send=1'b1;
  #(`T_CLK*1)send=1'b0;
  #(`T_CLK*1)send=1'b1;
  #(`T_CLK*1)send=1'b0;
  #(`T_CLK*1)send=1'b1;
  #(`T_CLK*1)send=1'b0;
  #(`T_CLK*2)load=1'b1;
  #(`T_CLK*1)load=1'b0;
  #(`T_CLK*1)send=1'b1;
  #(`T_CLK*3)send=1'b0;
  #(`T_CLK*1)send=1'b1;
  #(`T_CLK)send=1'b0;
  #(`T_CLK*2)$stop;
end  
    
initial begin
  din=4'b0000;
   wait(n_rst==1'b1);
  #(`T_CLK*2)din=4'b1001;
  #(`T_CLK*8)din=4'b1100;
  #(`T_CLK*11)din=4'b0110;
  #(`T_CLK*9)$stop;
end
    
TOP u_TOP(
  .clk(clk),
  .n_rst(n_rst),
  .load(load),
  .send(send),
  .din(din),
  .dout(dout),
  .dout_vld(dout_vld)
);

endmodule