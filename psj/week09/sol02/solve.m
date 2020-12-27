% 2.b 주어진 초기치로 극값 구하기
f = @(x) x^2 / 10 - 2 * sin(x);
% 계산기로 계산했을 때,
% x=-9.678, x=-4.271, x=1.427, x=7.069에서 극소
% x=-8.966, x=-1.746, x=5.267에서 극대

[x, fx, is_local_min, ea, it] = parabolic(f, 0, 4, 2);
if is_local_min
    fprintf('극소값에서의 x: %d, 극소값 f(x): %d, 상대오차: %d, 반복회수: %d\n', x, fx, ea, it)
else
    fprintf('극대값에서의 x: %d, 극대값 f(x): %d, 상대오차: %d, 반복회수: %d\n', x, fx, ea, it)
end

% 2.b 극대값일때도 잘 되는지 확인하기 위해 주어진 함수를 x축 대칭 시켜봄
% negative_f = @(x) - x^2 / 10 + 2 * sin(x);
% 
% [x, fx, is_local_min, ea, it] = parabolic(negative_f, 0, 4, 2);
% if is_local_min
%     fprintf('극소값에서의 x: %d, 극소값 f(x): %d, 상대오차: %d, 반복회수: %d\n', x, fx, ea, it)
% else
%     fprintf('극대값에서의 x: %d, 극대값 f(x): %d, 상대오차: %d, 반복회수: %d\n', x, fx, ea, it)
% end

% 2.a Parabolic Interpolation 구현
function [x, fx, is_local_min, ea, it] = parabolic(f, x1, x2, x3, es, maxit, varargin)
% parabolic: Parabolic Interpolation을 이용해 f의 극치와 그때의 x값을 구합니다.
% [x, fx, is_local_min, ea, it] = parabolic(f, x1, x2, x3, es, maxit, p1, p2, ...)
% input:
% f = 극값을 찾을 함수
% x1, x2, x3 = 초기치
% es = tolerance (default = 0.0001%)
% maxit = 최대 반복회수 (default = 50)
% p1, p2, ... = 함수에 사용되는 인자
% output:
% x = 극값에서의 x
% fx = 극값
% is_local_min = 극소값이면 1, 극대값이면 0
% ea = 상대오차 (%)
% it = 반복회수

if nargin < 4, error('at least 4 input arguments required'), end
if nargin < 5 || isempty(es), es = 0.0001; end
if nargin < 6 || isempty(maxit), maxit = 50; end

% 2.b 초기치 정렬하기
x = sort([x1 x2 x3]);
x1 = x(1);
x2 = x(2);
x3 = x(3);

ea = Inf;
it = 0;

% 함수 값은 최대한 재사용하기
fx1 = f(x1, varargin{:});
fx2 = f(x2, varargin{:});
fx3 = f(x3, varargin{:});
x4 = x2;
fx4 = fx2;

while (it < maxit && ea > es)
    it = it + 1;
    
    x4_old = x4;
    
    x4 = x2 - (((x2 - x1)^2 * (fx2 - fx3) - (x2 - x3)^2 * (fx2 - fx1)) / (2 * ((x2 - x1) * (fx2 - fx3) - (x2 - x3) * (fx2 - fx1))));
    fx4 = f(x4, varargin{:});
    
    ea = abs((x4 - x4_old) / x4) * 100;
    
    fprintf('반복회수=%d일 때, x1: %d, x2: %d, x3: %d => x4: %d\n', it, x1, x2, x3, x4)
    
    if x2 < x4
        x1 = x2;
        fx1 = fx2;
        x2 = x4;
        fx2 = fx4;
    else
        x3 = x2;
        fx3 = fx2;
        x2 = x4;
        fx2 = fx4;
    end
end

% 극값에서의 x와 극값 f(x)
x = x4;
fx = fx4;

% 극대 극소 판정을 위해 2계 도함수 구하기
h = 0.00001; % numerical differentiation step size
df = @(x, varargin) (f(x + h, varargin{:}) - f(x - h, varargin{:})) / (2 * h);
d2f = @(x, varargin) (df(x + h, varargin{:}) - df(x - h, varargin{:})) / (2 * h);
flex = d2f(x, varargin{:}); % 2계 도함수의 값

if flex > 0 % 극소
    is_local_min = 1;
else % 극대 또는 변곡인데, 최대 최소 구하는 알고리즘이므로 극대
    is_local_min = 0;
end
end
