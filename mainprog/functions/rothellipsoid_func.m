function [y] = rothellipsoid_func(x)
% F20 Rotated Hyper-ellipsoid function
% Search range: [-100, 100]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

D=size(x,2); % Problem dimension

Array1=[1:D];
sum1=sum((D+1-Array1).*x.^2);
y=sum1;

end