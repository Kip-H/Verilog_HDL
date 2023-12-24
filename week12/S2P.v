module S2P(
    input clk,
    input n_rst,
    input wire data,
    input wire vld,
    output reg [3:0] dout,
    output reg dout_vld
);
reg [2:0] count = 3'h0;

always @(posedge clk or negedge n_rst) begin
  if(!n_rst) begin
    dout <= 4'b0000;
  end
  else begin
    if(vld == 1'b1)
      dout <= {data, dout[3:1]};
    else
      dout <= dout;
  end
end

// count
always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        count <= 3'h0;
    else
        if (vld == 1'b1 && count < 4)
            count <= count + 1;
        else if(count == 3'h4)
            count <= 3'h0;
        else 
            count <= count;      
    end

// dout_vld 찾기
always @(count)
        if(count == 3'h4)
            dout_vld <= 1'b1;
        else
            dout_vld <= 1'b0;
endmodule