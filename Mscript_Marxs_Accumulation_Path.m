%실질임금과 고용량의 관계에 관한 Script m파일
%참고논문 : Okishio. "Competition and production price". p494
clear;

in_W = 0.7;
in_N = 70;

count = 100;
out_W = zeros(count+1,1);
out_N = zeros(count+1,1);

gX = zeros(count,1);%그래프의 X좌표(실질임금)
gY = zeros(count,1);%그래프의 Y좌표(고용량)

run FuctionScript_getNt2_Wt2;%m파일 호출.

out_W(1,1) = in_W;
out_N(1,1) = in_N;
for i=1:count
  W = getNt2Wt2(out_W(i),out_N(i));%계산결과 반환받음.
  out_W(i+1,1) = W(1);%Wt+1
  out_N(i+1,1) = W(2);%Nt+1
  
  gX(i,1) = out_W(i,1);
  gY(i,1) = out_N(i,1)/100;
endfor;

plot(gX,gY,'r-');%그래프 호출
xlabel("wt2");%x와 y좌표의 범례
ylabel("N/Ns");
title("Marxs Accumulation Path");
grid on;