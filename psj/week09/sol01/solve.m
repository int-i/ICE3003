% 1.b 주어진 초기치로 해 구하기
f = @(x) x^2 - 1; % 주어진 함수
% 식을 풀어 계산했을 때, x가 -1 또는 1일 때 f(x)=0이 됨

% 주어진 초기치
xl = 0;
xu = 4.4;

% f(x)=0일 때 x 구하기
[root, fx, ea, iter] = bisect(f, xl, xu);
fprintf('해 x: %d, f(x): %d, 상대오차: %d, 반복회수: %d\n', root, fx, ea, iter)

% 1.a 중간점을 무작위로 설정해 해를 구하는 bisection method
function [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,varargin)
% bisect: root location zeroes
% [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,p1,p2,...):
% uses bisection method to find the root of func
% input:
% func = name of function
% xl, xu = lower and upper guesses
% es = desired relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by func
% output:
% root = real root
% fx = function value at root
% ea = approximate relative error (%)
% iter = number of iterations
if nargin<3,error('at least 3 input arguments required'),end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0,error('no sign change'),end
if nargin<4|isempty(es), es=0.0001;end
if nargin<5|isempty(maxit), maxit=50;end
iter = 0; xr = xl; ea = 100;
while (1)
    xrold = xr;
    % xr = (xl + xu)/2; % 구간을 절반으로 분할
    xr = xl + (xu - xl) * rand(); % 1.a 구간을 임의로 분할
    iter = iter + 1;
    if xr ~= 0,ea = abs((xr - xrold)/xr) * 100;end
    test = func(xl,varargin{:})*func(xr,varargin{:});
    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
    else
        ea = 0;
    end
    if ea <= es | iter >= maxit,break,end
end

root = xr; fx = func(xr, varargin{:});
end
