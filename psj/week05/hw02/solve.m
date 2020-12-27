f1 = @(x) exp(- x/3) * cos(pi*x);
fprintf("f1'(1) = %d\n", dfdx(f1, 1));

b = 1;
c = 0.5;
f2 = @(x) 2 + b*x + c*(x^2);
fprintf("f2'(1) = %d\n", dfdx(f2, 1));

function out = dfdx(f, x)
delta = 0.000001;
out = (f(x + delta/2) - f(x - delta/2)) / delta;
end
