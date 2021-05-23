  %생산수단의 축적모형 2부문
%참고논문 : Okishio. "Competition and production price". p496~499clear;

time = 100;

%파라미터의 정의
a1=0.5;
a2=0.5;
n1=1;
n2=1;
H=0.1;
E=0.1;
Beta=0.5;

%Vector Difinition
stt_x1 = zeros(time+1,1);
stt_x2 = zeros(time+1,1);
stt_N = zeros(time,1);
stt_m = zeros(time,1);
stt_p1 = zeros(time,1);
stt_p2 = zeros(time,1);
stt_pe = zeros(time,1);
stt_D1= zeros(time,1);
stt_D2 = zeros(time,1);
r1 = zeros(time,1);
r2 = zeros(time,1);

%proper initial condition
stt_x1(1+1,1) = 100;
stt_x2(1+1,1) = (1-1.1*a1)*stt_x1(1+1,1)/(1*1*a2);%100.. = 0.5.. * 100 / 0.5

stt_N(1,1) = n1 * stt_x1(1+1,1) + n2 * stt_x2(1+1,1);%200 = 1 * 100 + 1 * 100
stt_m(1,1) = 1;

stt_p1(1,1) = 1.1*n1*stt_m(1,1) / (1-1.1*a1);%2.. = 1.1 / 0.5
stt_p2(1,1) = 1.1*(a2*stt_p1(1,1)+n2*stt_m(1,1));%2 = (0.5 * 2 + 1 * 1)
stt_pe(1,1) = stt_p2(1,1);%2 = 2

#r1(1,1) = stt_p1(1,1)/(a1*stt_p1(1,1)+n1*stt_m(1,1))-1;%0 = 2 / (0.5 * 2 + 1 * 1) - 1
#r2(1,1) = stt_p2(1,1)/(a2*stt_p1(1,1)+n2*stt_m(1,1))-1;%0 = 2 / (0.5 * 2 + 1 * 1) - 1
r1(1,1) = 0.10;
r2(1,1) = 0.10;

for t=1:time 
  
  %3.2~3 생산수단을 위한 수요와 가격.%
  stt_D1(t+1,1) = stt_p1(t,1)*(1+Beta*r1(t,1))*a1*stt_x1(t+1,1);
  stt_D2(t+1,1) = stt_p1(t,1)*(1+Beta*r2(t,1))*a2*stt_x2(t+1,1);
  stt_p1(t+1,1) = (stt_D1(t+1,1) + stt_D2(t+1,1)) / stt_x1(t+1,1);
  
  stt_x1(t+2,1) = (stt_D1(t+1,1)/stt_p1(t+1,1))/a1;
  stt_x2(t+2,1) = (stt_D2(t+1,1)/stt_p1(t+1,1))/a2;
  
  %3.4 고용된 노동자와 임금 
  stt_N(t+1,1) = (stt_x1(t+2,1)/n1)+(stt_x2(t+2,1)/n2);
  
  stt_pe(t+1,1) = stt_pe(t,1) + E*(stt_p2(t,1)-stt_pe(t,1));

  L = stt_m(t,1)/(stt_pe(t+1,1)*stt_N(t+1,1)^H);  
  stt_m(t+1,1) = stt_pe(t+1,1) * L*stt_N(t+1,1)^H;
  
  %3.5 소비재 가격%ㄴ
  stt_p2(t+1,1) = stt_m(t+1,1)*stt_N(t+1,1) / stt_x2(t+1,1);
  
  %3.1 Profit Rate  
  r1(t+1,1) = stt_p1(t+1,1)/(a1*stt_p1(t+1,1)+n1*stt_m(t+1,1))-1;
  r2(t+1,1) = stt_p2(t+1,1)/(a2*stt_p1(t+1,1)+n2*stt_m(t+1,1))-1;
  
endfor;

plot(1:1:time+1,r1,'r-',1:1:time+1,r2,'b-');%그래프 호출

ylabel("r1,r2");%x와 y좌표의 범례
xlabel("time");
title("Accumulation Model");
grid on;





