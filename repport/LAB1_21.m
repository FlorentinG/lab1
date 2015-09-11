function [] = LAB1_21()
%LAB1_21 
close all;
K = [0 1 4 6];
u0 = [1 1 1]';
N = 100;
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
    string = sprintf('Solution for K = %d',K(i));
    plot(t,u);hl=legend('y','$\dot{y}$','$\ddot{y}$');title(string);
    set(hl, 'Interpreter', 'latex');
end
    
%root locus
sys = tf(1,[1 3 2 0]);
figure;
k = 0:0.005:10;
rlocus(sys,k);
end

