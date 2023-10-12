module hw_case(
    input [2:0] din0,
    input [2:0] din1,
    input [1:0] sel,
    output reg [2:0] dout
);

always @(din0 or din1 or sel)
begin
    case(sel)
        2'h0: dout = din0 + din1;
        2'h1: dout = din0 + ((~din1) + 3'b001);
        2'h2: dout = din0 & din1;
        2'h3: dout = {1'b0, din0[2:1]};
        default: dout = din0 + din1;
    endcase
end
endmodule