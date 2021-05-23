%실질임금과 고용량의 관계에 관한 함수 m파일.
%해당 함수는 반복문으로 호출된다.
%참고논문 : Okishio. "Competition and production price". p494
function W = getNt2Wt2(in_Wt1, in_Nt1)

W = zeros(2,1);%반환할 변수의 정의. 2X1 차원의 벡터

%파라미터들을 정의한다
s=0.5;
mu=1;
t2=1;
h=1;
Ns=100;
z=0.8;

out_Wt2 = in_Wt1*[1+h*(in_Nt1/Ns-z)];%Wt+1

NWt2 = in_Nt1*[1+mu-(1-s)*(1-in_Wt1*t2)];%Nt+1(Wt+1 t2)
out_Nt2 = NWt2/(out_Wt2*t2+mu);%Nt+1

%t+2의 W와 N을 반환한다.
W(1) = out_Wt2;
W(2) = out_Nt2;

endfunction