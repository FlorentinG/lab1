function [] = LAB1_21()
%LAB1_21 
K = [0 1 4 8];
u0 = [1 1 1]';
N = 1000;
u = [u0 zeros(3,N)];
tfinal = 10;
h = tfinal/N;
t=0:h:tfinal;

for i=1:4
    A=[0 1 0;0 0 1;-K(i) -2 -3];
    for j=2:N+1
        u(:,j) = expm(A*t(j))*u0;
    end
    subplot(2,2,i);
    plot(t,u);
end
    
%root locus
sys = tf(1,[1 3 2 0]);
figure;
rlocus(sys,0:0.001:10);
end

