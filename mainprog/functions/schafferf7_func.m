function [y] = schafferf7_func(x)
% F18 Schaffer’s F7 function 
% Search range: [-100, 100]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

D=size(x,2); % Problem dimension

xiplus1=x(2:D);
xi=x(1:D-1);
si=sqrt(xi.^2+xiplus1.^2);
sum1=sum(sqrt(si)+sqrt(si).*(sin(50*si.^0.2)).^2);

y=(1/(D-1)*sum1)^2;

end