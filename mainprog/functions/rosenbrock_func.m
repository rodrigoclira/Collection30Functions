function [y] = rosenbrock_func(x)
% F13 Rosenbrock's function
% Search range: [-10, 10]^D
% Minimum: f(x*)=0 at x*={1, 1, ..., 1}

D=size(x,2); % Problem dimension

xiplus1=x(2:D);
xi=x(1:D-1);
sum1=sum(100*(xiplus1-xi.^2).^2 + (xi-1).^2);

y=sum1;

end