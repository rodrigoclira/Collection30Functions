function [y] = sumpow2_func(x)
% F22 Sum of Different Powers 2 function
% Search range: [-10, 10]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

D=size(x,2); % Problem dimension

Array1=[1:D];
y=sum((abs(x)).^(2+4*(Array1-1)./(D-1)), 2);

end