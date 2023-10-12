`timescale 1ns/100ps
module tb_hw_assign;
reg [2:0] din0; // reg를 사용하여 값을 저장할 수 있도록 하였다.
reg [2:0] din1; // reg를 사용하여 값을 저장할 수 있도록 하였다.
reg [1:0] sel; // reg를 사용하여 값을 저장할 수 있도록 하였다.
wire [2:0] dout; // 출력 데이터를 저장하기 위해 wire를 선언하였다.

initial begin
din0 = 3'h2;
din1 = 3'h1;
sel = 2'h0;
#(10) sel = 2'h1;
#(10) sel = 2'h2;
#(10) sel = 2'h3;
#(10)
din0 = 3'h3; //3bit 16진수로 표현하여 값을 집어넣었다.
din1 = 3'b110; //-2 2의보수의 결과로 넣어주었다.
sel = 2'h0; // 0을 할당
#(10) sel = 2'h1; // 1을 할당
#(10) sel = 2'h2; // 2를 할당
#(10) sel = 2'h3; // 3을 할당
#(10) $stop;
end
hw_assign u_hw_assign(
.din0(din0),
.din1(din1),
.sel(sel),
.dout(dout)
);
//위 4개는 제대로 연결될 수 있도록 이름에 의한 포트 연결을 해주었다.
endmodule