module sr_latch (
sbar, 
rbar, 
q, 
qbar );
// 포트 선언
input sbar;
input rbar;
output q;
output qbar;
reg qbar;
// output 의 기본 데이터형은 wire
assign q = ~(sbar & qbar);
always @(q or rbar)
qbar = ~(q & rbar);
endmodule