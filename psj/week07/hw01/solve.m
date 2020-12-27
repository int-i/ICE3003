% Prob. 4.2

fprintf('1011001 = %d\n', parse_binary('1011001')) % 1 + 8 + 16 + 64 = 89
fprintf('0.01011 = %f\n', parse_binary('0.01011')) % 0.25 + 0.0625 + 0.03125 = 0.34375
fprintf('110.01001 = %f\n', parse_binary('110.01001')) % 2 + 4 + 0.25 + 0.03125 = 6.28125

% 추가적인 테스트
% fprintf('0 = %d\n', parse_binary('0')) % 0
% fprintf('-101 = %d\n', parse_binary('-101')) % -5
% fprintf('-101.01 = %f\n', parse_binary('-101.01')) % -5.25

% 임의의 입력
% s = input('Binary Number: ', 's');
% fprintf('%s = %f\n', s, parse_binary(s))

function out = parse_binary(str)
% 입력한 문자열 이진수를 십진수로 변환해 출력합니다.
% 입력한 문자열의 유효성을 검사하지 않습니다.

% 부동소수점 실수의 유효숫자와 계산오차로 인해 숫자가 아닌 문자열 형태를 처리하는 것이 정확하다.
len = length(str);
if len < 1, error('Invalid'), end

sn = 1; % 부호
start_idx = 1; % 시작 숫자의 위치
if str(1) == '+'
    sn = 1;
    start_idx = 2;
elseif str(1) == '-'
    sn = -1;
    start_idx = 2;
end
last_idx = len; % 마지막 숫자의 위치

dot_idx = last_idx + 1; % 소수점 위치
idx = start_idx;
while idx <= last_idx
    if str(idx) == '.'
        dot_idx = idx;
        break
    end
    idx = idx + 1;
end
% 소수점 표시가 없다면 dot_idx는 마지막 숫자 뒤를 가리킬 것이다.

out = 0;

% 정수 계산
idx = dot_idx - 1;
while idx >= start_idx
    if str(idx) == '1'
        out = out + 2^(dot_idx - idx - 1);
    end
    idx = idx - 1;
end

% 소수 계산
idx = dot_idx + 1;
while idx <= last_idx
    if str(idx) == '1'
        out = out + 2^-(idx - dot_idx);
    end
    idx = idx + 1;
end

% 부호 계산
out = out * sn;
end
