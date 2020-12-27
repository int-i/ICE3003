% Prob. 2.15

% 그래프 여러개 그리기
hold on

% 그래프 축 설정
xlabel('x')
ylabel('cos(x)')

% x축
x = linspace(0, 3 / 2 * pi);

% 직접 5번째 항까지의 계산식을 작성해서 계산
y1 = 1 - (x .^ 2) / factorial(2) + (x .^ 4) / factorial(4) - (x .^ 6) / factorial(6) + (x .^ 8) / factorial(8);
% plot(x, y1, 'k--')

% 조금 더 유연한 방법
% 원리: arrayfun는 2번째 인자로 주어진 배열 각각의 값을 1번째 인자로 주어진 함수에 넣어 반환된 값을 배열로 반환함
%       @(x_i) 는 함수의 정의
%       sum은 배열 원소의 합을 반환하는 함수로, x_i에 대한 cos의 테일러 급수의 n번째 항의 배열을 입력으로 넣어줌
%       sum의 출력은 x_i에 대한 근사된 cos(x_i)
n = 0:4; % 숫자 간격은 1
y2 = arrayfun(@(x_i) sum(((-1) .^ n ./ factorial(2 * n)) .* (x_i .^ (2 * n))), x);
plot(x, y2, 'k--')

% n을 늘리면 원래의 cos 값과 더 가까운 값을 구할 수 있음
% 7번째 항까지 계산 했을 때,
n = 0:6;
y3 = arrayfun(@(x_i) sum(((-1) .^ n ./ factorial(2 * n)) .* (x_i .^ (2 * n))), x);
plot(x, y3, 'b')

% 원래의 cos 그래프
y = cos(x);
plot(x, y, 'r')

% 그래프의 범례 추가
legend('5번째 항까지','7번째 항까지', '실제 cos 함수')

hold off
