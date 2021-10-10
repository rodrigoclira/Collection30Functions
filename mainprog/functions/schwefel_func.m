function [y] = schwefel_func(x)
% F21 Schwefel function 
% Search range: [-500, 500]^D
% Minimum: f(x*)=0 at x*={c, c, ..., c}
% Where c=420.968746359982025

D=size(x,2);

y = -sum(x.*sin(sqrt(abs(x)))) + 418.9828872724337*D;

end