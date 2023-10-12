module hw_always(
    input [2:0] din0,
    input [2:0] din1,
    input [1:0] sel,
    output reg [2:0] dout
);

always @(din0 or din1 or sel)
    begin
    if(sel == 2'b00)
        dout = din0 + din1;
    else if(sel == 2'b01)
        dout = din0 + ((~din1) + 3'b001);
    else if(sel == 2'b10)
        dout = din0 & din1;
    else
        dout = {1'b0, din0[2:1]};
    end
endmodule