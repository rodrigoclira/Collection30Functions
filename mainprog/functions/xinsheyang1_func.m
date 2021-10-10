function [y] = xinsheyang1_func(x)
% F23 Xin-She Yang’s 1 function 
% Search range: [-2*pi, 2*pi]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

sum1=sum(abs(x));
sum2=sum(sin(x.^2));
y=sum1*exp(-sum2);

end