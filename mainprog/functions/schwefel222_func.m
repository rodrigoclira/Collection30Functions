function [y] = schwefel222_func(x)
% F25 Schwefel 2.22 function 
% Search range: [-100, 100]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

y=sum(abs(x)) + prod(abs(x));

end