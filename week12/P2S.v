module P2S(
  input clk,
  input n_rst,
  input wire [3:0] din,
  input wire load,
  input wire send,
  output reg data,
  output reg vld
);

  reg [3:0] shift_register;

always @(posedge clk or negedge n_rst) begin
  if (!n_rst) begin
    shift_register <= 4'b0000;
  end
  else begin     
    if(load)
      shift_register <= din;
    else begin
      if(send == 1'b1) begin
        shift_register <= {1'b0, shift_register[3:1]};
      end
      else
        shift_register <= shift_register;
    end
  end
end

always @(posedge clk or negedge n_rst) begin
  if(!n_rst) begin
    vld <= 1'b0;
    data <= 1'b0;
  end
  else begin
    if(send == 1'b1) begin
      data <= shift_register[0];
      vld <= 1'b1;
    end
    else begin
      vld <= 1'b0;
      data <= data;
  end
  end
end

endmodule