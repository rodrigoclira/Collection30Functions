function [y] = modxinsyang5_func(x)
% F30 Modified Xin-She Yang’s 5 function 
% Search range: [-100, 100]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

sum1=sum(sin(x).^2,2);
sum2=sum(x.^2,2);
sum3=sum(sin(sqrt(abs(x))).^2,2);

y = 1e4 * ( 1 + (sum1-exp(-sum2)) .* exp(-sum3) );

end