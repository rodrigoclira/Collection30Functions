function [y] = permdb_func(x)
% F17 Perm D, Beta function
% Search range: [-D, D]^D generally, [-50, 50]^D in this study
% Minimum: f(x*)=0 at x*={1, 2, ..., D}

D=size(x,2); % Problem dimension
Array1=[1:D];

sum2 = 0;

for i = 1:D;
	sum1 = sum((Array1.^i+0.5).*((x./Array1).^i-1),2);
	sum2 = sum2 + sum1^2;
end

y = sum2;

end