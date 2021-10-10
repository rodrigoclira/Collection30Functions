function [y] = salomon_func(x)
% F26 Salomon function 
% Search range: [-20, 20]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

sum1=sum(x.^2);
y=1-cos(2*pi*sqrt(sum1)) + 0.1*sqrt(sum1);

end