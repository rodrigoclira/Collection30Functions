function [y] = bent_cigar_func(x)
% F16 Bent Cigar function
% Search range: [-100, 100]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

D=size(x,2); % Problem dimension

x2toend=x(2:D);
sum1=sum(x2toend.^2, 2);

y=x(1)^2 + 1000000*sum1;

end