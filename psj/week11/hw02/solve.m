% Prob. 15.19
T = [0 10 20 30 40];
K_w = [1.164e-15 2.950e-15 6.846e-15 1.467e-14 2.929e-14];

T_a = T + 273.15; % 매우 작은 숫자에서 큰 숫자를 더했기 때문에 roundoff error 발생

a = linreg(T_a', K_w');

% Print the result
fprintf('a = %f, b = %f, c = %f, d = %f\n', a)

% Visualize
hold on
plot(T_a, K_w, 'o')
fplot(@(x) 1 ./ (x.^a(2) .* 10.^(a(1)./x + a(3)*x + a(4))));
hold off

function a = linreg(x, y)
    n = length(x);

    Z = ones(n, 4);
    Z(:, 1) = 1 ./ x;
    Z(:, 2) = log10(x);
    Z(:, 3) = x;
    Z(:, 4) = ones(n, 1);

    Y = -log10(y);

    % the coefficients of the model
    a = (Z' * Z) \ (Z' * Y);
end
