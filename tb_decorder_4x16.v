`timescale 1ns/100ps

module tb_decoder_4x16;

//din? wire?? reg? ???. 
reg [3:0] din;
wire [15:0] dout;

decoder_4x16 u_decoder_4x16(
        .din(din),
        .dout(dout)
);

integer i;

initial begin
  din = 4'h0;
  for (i=0; i<16; i=i+1) begin
    #5 din = din + 4'h1;
  end
  #5 $stop;
end

initial begin
  $monitor(" %h => %h", din, dout);
end

endmodule
