function [] = LAB1_1()
%LAB1_1
%always stable because det(A)>0 and tr(A)<0
close all;

L = 0.1;
C = 0.1;
R = [0.01 0.1 1 10];
E = 1;
g = [0 E/L]';

N = 1000;
tfinal = [5 5 5 5];

q = zeros(2,N+1);

for i=1:4
    h = tfinal(i)/N;
    t = 0:h:tfinal(i);
    A = [0 1;-1/(L*C) -R(i)/L];
    for j=2:N+1
        q(:,j) = A\((expm(A*t(j))-eye(2))*g);
    end
    subplot(2,2,i);
    plot(t,q); xlabel('Time (sec)'); hl=legend('q','$\hat{q}$');
    set(hl, 'Interpreter', 'latex');
end

end
