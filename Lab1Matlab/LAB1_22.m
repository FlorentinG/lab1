function [] = LAB1_22()
%LAB1 Summary of this function goes here
%   Detailed explanation goes here

approx = [8 -5 2; -8 5 2; 9 3 7; -9 -3 7];
sol = zeros(4,3);
for i=1:4
    sol(i,:) = fsolve(@(u) twoB(0,u),approx(i,:));
    %jacobian = [5-sol(i,3) 4 -sol(i,1);1 4-sol(i,3) -sol(i,2);2*sol(i,1) 2*sol(i,2) 0];
    %lambda = eig(jacobian);
    [t,y] = ode45(@twoB,[0 10],sol(i,:));
    subplot(2,2,i);
    plot(t,y(:,1),'o');
    twoB(0,sol(i,:))
end
sol
end

function dudx = twoB(t,u)
%Computes derivative of u in part 2b
dudx = u;
dudx(1) = 5*u(1) + 4*u(2) - u(1)*u(3);
dudx(2) = u(1) + 4*u(2) - u(2)*u(3);
dudx(3) = u(1)*u(1) + u(2)*u(2) - 89;
end

