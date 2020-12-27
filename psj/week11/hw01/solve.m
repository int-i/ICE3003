% Prob. 15.3
x = [3 4 5 7 8 9 11 12];
y = [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6];

% Ex. 15.1
% x = [0 1 2 3 4 5];
% y = [2.1 7.7 13.6 27.2 40.9 61.1];

% the desired order
m = 3; % m+1<n일 때만 s_{y/x}을 구할 수 있음

[a, r2, s_yx] = polyreg(x, y, m);

% Print the result
disp('the coefficients = ')
disp(a)
disp('the coefficient of the determination r^2 = ')
disp(r2)
disp('the standard error of the estimate s_{y/x} = ')
disp(s_yx)

% Visualize
hold on
axis([min(x - 1) max(x + 1) min(y - 1) max(y + 1)])
plot(x, y, 'o')
fplot(@(x) polyval(a, x))
hold off

% Prob. 15.4
function [a, r2, s_yx] = polyreg(x, y, m)
    n = length(x);

    N = zeros(m + 1, m + 1);
    for i = 1:(m + 1)
        for j = 1:(m + 1)
            N(i, j) = sum(x .^ (i + j - 2));
        end
    end

    r = zeros(m + 1, 1);
    for i = 1:(m + 1)
        r(i) = sum((x .^ (i - 1)) .* y);
    end

    % the coefficients of the model
    a = flip(N \ r); % a(1)는 x^m의 계수

    % the sum of the squares of the residuals
    S_r = sum((y - polyval(a, x)) .^ 2);

    % the standard error of the estimate
    s_yx = sqrt(S_r / (n - m - 1));

    % the coefficient of the determination
    y_bar = mean(y);
    S_t = sum((y - y_bar) .^ 2);
    r2 = (S_t - S_r) / S_t;
end
