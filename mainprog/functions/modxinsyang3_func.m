function [y] = modxinsyang3_func(x)
% F29 Modified Xin-She Yang’s 3 function 
% Search range: [-20, 20]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

sum1=sum((x/15).^10,2);
sum2=sum(x.^2);
y = 1e4 * ( 1+(exp(-sum1)-2*exp(-sum2)) * prod(cos(x).^2) );
    
end