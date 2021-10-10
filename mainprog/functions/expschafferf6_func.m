function [y] = expschafferf6_func(x)
% F19 Expanded Schaffer’s F6 function 
% Search range: [-100, 100]^D
% Minimum: f(x*)=0 at x*={0, 0, ..., 0}

D=size(x,2); % Problem dimension

g = @(z,y) 0.5 + (sin(sqrt(z.^2+y.^2)).^2 - 0.5) ./ (1+0.001*(z.^2+y.^2)).^2 ;

sum1=0;
for i=1:D-1;
    sum1=sum1+g(x(i),x(i+1));
end

y=sum1+g(x(D),x(1));

end