% Prob. 4.24

[x1, x2] = get_x1(1, -5000.002, 10);
fprintf('quadratic formula:\nx1 = %f, x2 = %f\n\n', x1, x2)

[x1, x2] = get_x2(1, -5000.002, 10);
fprintf('alternative quadratic formula:\nx1 = %f, x2 = %f\n', x1, x2)

% 5-digit arithmetic with chopping
function out = fix_digit(value)
    out = floor(abs(value) * 10000) / 10000;
    if value < 0, out = -out; end
    % out=value; % disable chopping
end

% 공식1에 5-digit arithmetic with chopping을 적용
function [x1, x2] = get_x1(a, b, c)
    rt = fix_digit(sqrt(fix_digit(fix_digit(b ^ 2) - 4 * fix_digit(a * c))));
    x1 = fix_digit(fix_digit(-b + rt) / (2 * a));
    x2 = fix_digit(fix_digit(-b - rt) / (2 * a));
end

% 공식2에 5-digit arithmetic with chopping을 적용
function [x1, x2] = get_x2(a, b, c)
    rt = fix_digit(sqrt(fix_digit(fix_digit(b ^ 2) - 4 * fix_digit(a * c))));
    fprintf('fix_digit(b - rt) = %f\n', fix_digit(b - rt))
    x1 = -2 * fix_digit(c / fix_digit(b + rt));
    x2 = -2 * fix_digit(c / fix_digit(b - rt));
end
