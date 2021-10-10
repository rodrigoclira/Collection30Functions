function [y] = discus_func(x)
% F15 Discus function
% Search range: [-100, 100]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

D=size(x,2); % Problem dimension

x2toend=x(2:D);
sum1=sum(x2toend.^2, 2);

y=1000000*x(1)^2 + sum1;

end