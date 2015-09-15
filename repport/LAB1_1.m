% LAB1_1.m - Script for question 1
% Authors: Florentin Goyens and David Weicker

close all;
L = 0.1;
C = 0.1;
R = [0.01 0.1 1 10];
E = 1;
g = [0 E/L]';
N = 1000;
tfinal = [10 5 2 5];
y = zeros(2,N+1); % Preallocation and initial condition

tit = {'Solution for R = 0.01','Solution for R = 0.1','Solution for R = 1','Solution for R = 10'};

for i=1:4 % For each value of R
    h = tfinal(i)/N;
    t = 0:h:tfinal(i);
    A = [0 1;-1/(L*C) -R(i)/L];
    for j=2:N+1
        y(:,j) = A\((expm(A*t(j))-eye(2))*g); % Using (2.26) in notes and zero initial condition
    end
    subplot(2,2,i);
    plot(t,y);title(tit{i}); xlabel('Time (sec)');ylabel('Charge (C) and current (A)'); hl=legend('q','$\dot{q}$');
    set(hl, 'Interpreter', 'latex');
end

