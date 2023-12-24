module tb_sr_latch;
// module 내부에서 사용할 wire, reg 선언
wire q, qbar; 
reg set, reset; 
// 하위 모듈의 파생.
sr_latch u_sr_latch(
.sbar(~set), 
.rbar(~reset),
.q(q), 
.qbar(qbar)
);
initial begin
$monitor($time, " set = %b, reset= %b, 
q= %b\n", set, reset, q);
set = 0; reset = 0;
#5 reset = 1; 
#5 reset = 0; 
#5 set = 1;
end
endmodule