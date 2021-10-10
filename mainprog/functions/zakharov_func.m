function [y] = zakharov_func(x)
% F28 Zakharov function 
% Search range: [-10, 10]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

D=size(x,2);
Array1=[1:D];

sum1=sum(x.^2);
sum2=sum(0.5*Array1.*x,2);

y = sum1 + sum2^2 + sum2^4;

end