function [y] = ellipt_func(x)
% F14 High Conditioned Elliptic function
% Search range: [-100, 100]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

D=size(x,2); % Problem dimension

Array1=[1:D];
sum1=sum((1000000).^((Array1-1)/(D-1)).*x.^2) ;
y=sum1;

end