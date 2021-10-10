function [y] = modridge_func(x)
% F27 Modified Ridge function 
% Search range: [-100, 100]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

x2=x.^2;
x2(1)=[];
sum1=sum(x2);
y=abs(x(1))+2*sum1^0.1;

end