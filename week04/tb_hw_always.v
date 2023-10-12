`timescale 1ns/100ps

module tb_hw_always;
reg [2:0] din0;
reg [2:0] din1; 
reg [1:0] sel; 
//상태정보를 저장한 뒤 시뮬레이션하기 위해 위에 3줄 모두 입력 데이터를 저장하는 레지스터로 선언하였다.
wire [2:0] dout;
// 출력데이터를 저장하기 위해 wire로 선언해주었다.
initial begin
    din0 = 3'h2;
    din1 = 3'h1;
    sel = 2'h0;
    #(10) sel = 2'h1;
    #(10) sel = 2'h2;
    #(10) sel = 2'h3;
    #(10)

    din0 = 3'h3;
    din1 = 3'b110;
    sel = 2'h0;
    #(10) sel = 2'h1;
    #(10) sel = 2'h2;
    #(10) sel = 2'h3;
    //테스트를 할 값들은 din0의 경우 3, din0는 -2, sel은 0~3까지 이기에 각 해당하는 bit로 값을 넣어주었다.
    // din1의 경우 -2 값을 넣어주기 위해 2의 보수를 사용했다.
    #(10) $stop;
end

hw_always u_hw_always(
    .din0(din0),
    .din1(din1),
    .sel(sel),
    .dout(dout)
    //hw_assign을 인스턴스화 하여 모듈의 입력과 출력을 연결했다.
);
endmodule