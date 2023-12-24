`timescale 1ns/1ps
`define T_CLK 10
module tb_doorlock;

  reg clk;
  reg n_rst;
  reg start;
  reg bt_0;
  reg bt_1;
  reg bt_2;


  initial begin
    clk = 1'b1;
    n_rst = 1'b0;
    #(`T_CLK * 2.2) n_rst = 1'b1;
  end

  always #(`T_CLK/2) clk = ~clk;

  initial begin
    start = 1'b0;
    wait(n_rst == 1'b1);
    #(`T_CLK * 0.1);
    #(`T_CLK) start = 1'b1;
    #(`T_CLK * 8) start = 1'b0;
    #(`T_CLK * 4) start = 1'b1;
    #(`T_CLK * 8) start = 1'b0;
    #(`T_CLK * 4) start = 1'b1;
    #(`T_CLK * 8) start = 1'b0;
    #(`T_CLK * 7) $stop;
  end
  
 initial begin
  bt_0 = 1'b0;
  wait(n_rst == 1'b1);
  #(`T_CLK * 0.1);
  #(`T_CLK * 5) bt_0 = 1'b1;
  #(`T_CLK) bt_0 = 1'b0;
  #(`T_CLK * 20) bt_0 = 1'b1;
  #(`T_CLK) bt_0 = 1'b0;
  #(`T_CLK * 3) bt_0 = 1'b1;
  #(`T_CLK) bt_0 = 1'b0;
  #(`T_CLK * 7) $stop;
end
  
 initial begin
  bt_1 = 1'b0;
  wait(n_rst == 1'b1);
  #(`T_CLK * 0.1);
  #(`T_CLK * 16) bt_1 = 1'b1;
  #(`T_CLK) bt_1 = 1'b0;
  #(`T_CLK * 21) $stop;
end
  
  initial begin
  bt_2 = 1'b0;
  wait(n_rst == 1'b1);
  #(`T_CLK * 0.1);
  #(`T_CLK * 2) bt_2 = 1'b1;
  #(`T_CLK) bt_2 = 1'b0;
  #(`T_CLK * 12) bt_2 = 1'b1;
  #(`T_CLK) bt_2 = 1'b0;
  #(`T_CLK * 22) $stop;
end

doorlock u_doorlock(
    .clk(clk),
    .n_rst(n_rst),
    .start(start),
    .bt_0(bt_0),
    .bt_1(bt_1),
    .bt_2(bt_2),
    .bt_0d1(bt_0d1),
    .bt_1d1(bt_1d1),
    .bt_2d1(bt_2d1),
    .bt_0d2(bt_0d2),
    .bt_1d2(bt_1d2),
    .bt_2d2(bt_2d2),
    .bt_0_on(bt_0_on),
    .bt_1_on(bt_1_on),
    .bt_2_on(bt_2_on),
    .led_0(led_0),
    .led_1(led_1),
    .led_2(led_2),
    .led_fail(led_fail),
    .led_ok(led_ok)
);
endmodule 