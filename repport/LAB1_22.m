function [sol,lambda] = LAB1_22()
%LAB1_22
%Matlab code for part 2b
%Author : David Weicker and Florentin Goyens
close all;

approx = [8 -5 2; -8 5 2; 9 3 7; -9 -3 7];
sol = zeros(3,4);
lambda = zeros(3,4);
for i=1:4
    sol(:,i) = fsolve(@twoB,approx(i,:))';
    jacobian = [5-sol(3,i) 4 -sol(1,i);1 4-sol(3,i) -sol(2,i);2*sol(1,i) 2*sol(2,i) 0]; %analytical jacobian
    lambda(:,i) = eig(jacobian);
end

end

function dudx = twoB(u)
%Computes derivative of u in part 2b
dudx = u;
dudx(1) = 5*u(1) + 4*u(2) - u(1)*u(3);
dudx(2) = u(1) + 4*u(2) - u(2)*u(3);
dudx(3) = u(1)*u(1) + u(2)*u(2) - 89;
end

