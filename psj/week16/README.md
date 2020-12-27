# Final Exam

## Theory

### 1. Data 개수가 n개인 discrete data set (xi, yi)이 있다. 이들을 1차 다항식에 곡선 맞춤(curve fitting)하기 위한 linear regression 과정을 서술하라.

㈜ 이 문제는 공식 유도를 요구하는 것이 아니라 linear regression 개념을 묻는 문제임. 따라서, 답안에 공식을 기재하지 않아도 되지만, 설명 없이 공식만 기재한 경우는 오답으로 처리.

### 2. 주기(T)가 1.6 sec인 주기적인 파형을 0.2 sec(sampling time)마다 총 8번 sampling하여 discrete data를 획득하였다. 이 data에 fast Fourier transform (FFT)를 적용하여 표와 같은 결과를 얻었다고 가정하자.

| index | k   | 실수부  | 허수부  |
| ----- | --- | ------ | ------ |
| 1     | 0   | 3      | 0      |
| 2     | 1   | 0      | .5 0   |
| 3     | 2   | 0      | 0      |
| 4     | 3   | 0      | 0.25   |
| 5     | 4   | 0      | 0      |
| 6     | -3  | 0      | -0.25  |
| 7     | -2  | 0      | 0      |
| 8     | -1  | 5      | 0      |

#### (a) Sampling frequency (fs), Nyquist frequency (fmax), lowest detectable frequency (fmin)를 모두 구하라.

#### (b) Index가 2인 Fourier component가 갖는 진동수?

#### (c) 주기적인 파형의 함수 표현 f(t)를 구하라.

### 3. Composite Simpson's 1/3 rule을 이용하여 다음 적분을 수행하라. 이때, step size는 h = 0.5이다.

integral 0 to 2 (1 - x - 4x^3) dx

### 4. 주어진 data set (xi, yi)에서 독립 변수 xi가 등간격이라면, Richardson extrapolation 기법 등을 활용해 수치 미분의 정확도를 향상시킬 수 있다. 그러나 data set이 측정 오차를 포함하고 있고 독립 변수 xi가 등간격이 아니라면, Richardson extrapolation 기법을 활용할 수 없으며, 수치 미분 결과는 측정 오차의 영향을 크게 받게 된다. 이런 문제점을 해결하는 방안을 서술하라.

㈜ 수식을 열거할 필요는 없음.

### 5. 다음 관계식을 만족하는 함수(해), y(t)의 값을 t = 0.0, 0.5, 1.0에서 각각 구하라.

(Hint) 미분 방정식 풀이법을 활용해도 좋고, 수치 적분법을 활용해도 좋음.

y(t) - y(t_i) = integral t_i to t -2ty dt, y(t_i) = 10, t_i = 0
