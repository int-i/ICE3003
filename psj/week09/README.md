# Midterm Exam

## Theory

### 1. 어떤 컴퓨터에서 실수는 부동소수점 표기에 관한 IEEE double-precision format, 즉 `±(1+f)*2^e` 형식에 따라 표현된다.

여기서 `f`는 mantissa(the fractional part of the significand)이고, `e`는 exponent이다.
만일 해당 컴퓨터에서 exponent와 그 부호를 위해 4 bits를, mantissa를 위해 4 bits를 각각 사용한다면, 십진수 실수인 "0.5"와 "0.3"은 컴퓨터 내에서 각각 어떻게 표현되는가?
이때의 roundoff error를 구해 십진수 실수로 나타내라.

### 2.

#### a) 방정식의 해를 구하는 함수(routine)을 활용해서 수학 함수가 극치를 갖는 조건을 구할 수 있다. 이 개념(방법)을 간략히 서술하라.

#### b) 위의 개념과는 반대로 함수의 극치를 구하는 함수(routine)을 활용해서 방정식의 해를 구할 수 있다. 이 개념(방법)을 간략히 서술하라.

### 3. 오른쪽 그림은 Simple Fixed-Point Iteration에서 초기치 `x0`로부터 순차적으로 근사해를 구해 나가는 과정을 나타낸 것이다.

그림에서 `x0`로부터 출발하는 첫 번째 화살표로 시작하여 마지막 화살표가 그려지는 과정까지를 모두 설명하라.

### 4. Newton-Raphson Method는 방정식의 해를 구하는데 가장 흔히 활용되는 방법이나, 해가 발산하는 경우도 있다.

`x = g(x)`꼴을 활용하는 Simple Fixed-Point Iteration의 수렴 조건을 참고하여 Newton-Raphson Method의 수렴 조건을 유도하라.

### 5. Golden-Section Search Method를 활용하여 다음 함수의 극치와 그 때의 `x`를 구하라.

이때 초기치로 `xl = 0`, `xu = 0`을 사용한다.
반복 계산을 3번 이상 수행해야 하며, 각 반복 과정의 `xl`, `xu` 중간 점인 `x1`,`x2` 그리고 4개 점에서 함수 값을 답안에 모두 제시해야 한다. (참고로 황금비를 `phi = 1.618`이라고 가정하자)

## Practice

### 1. Bisection Method

#### a) 교재(sec. 5.4)에 나와 있는 bisection code를 일부 변형하여 방정식의 해, `f(x)=0`를 구하는 새로운 code를 작성하라.

Bisection 법에서는 해가 존재하는 구간 `xl`~`xu`를 알고 있는 상태에서 구간 중심점을 구하고, 구간 중심점에 의해 양분되는 왼편과 오른편 subintervals 중 어느 subinterval에 해가 존재하는지를 판단한다.
이 방법과 달리 interval을 분할하는 중간 점을 무작위로 설정하고, 그 점의 왼편과 오른편 subintervals 중 어느 subinterval에 해가 존재하는지를 판단한다고 하자.
이런 식으로 방정식의 해를 구하는 code를 완성하라.

참고로 구간 내 중간 점 좌표 `xr`을 무작위로 계산하는 Matlab 표현은 다음과 같다.

```matlab
xr = xl + (xu – xl) * rand();
```

#### b) 작성된 code를 이용하여 `x^2 – 1 = 0`의 해를 구하라.

이때 초기치(initial guess)로 `xl = 0`, `xu = 4.4`를 활용하라. (문제에서 요구한 code를 작성하지 못한 경우에는 Matlab이 제공하는 built-in function를 활용하여 해를 구하라)

See [Sol. 1](./sol01/solve.m)

### 2. Parabolic Interpolation

#### a) Parabolic interpolation 방법을 이용하여 함수 `f(x)`의 극치(극대 값 또는 극소 값)와 그때의 `x`를 구하는 code를 함수(subroutine) 형태로 작성하라.

작성된 함수는 초기치(`x1`, `x2`, `x3`)에 의해 정의되는 구간에서 `f(x)`가 극대 값을 갖는다면 극대 값을, `f(x)`가 극소 값을 갖는다면 극소 값을 찾아내야 한다.
작성될 함수의 입력 인수를 passed function 형태의 수학 함수 `f(x)`, 세가지 초기치 `x1`, `x2`, `x3`, tolerance `es`, 최대 반복 회수 `maxit`로 해야 한다.
또한, 극치를 구하는 반복 과정마다 iteration 회수 `it`, `x1`, `x2`, `x3`와 그로부터 결정되는 `x4`를 매번 출력해야 한다.
작성된 함수의 출력은 극치(함수 값), 극치가 극대 값인지 극소 값인지, 그때의 `x`, 상대오차 `ea`, 반복회수 `it`이어야 한다. (단, passed function 형태로 code를 작성할 수 없다면, 수학 함수 `f(x)`를 sub-function으로 정의해도 좋으나 약간의 감점이 있을 것임)

#### b) 작성된 code를 활용하여 다음 수학 함수의 극치, 극치가 극대 값인지 극소 값인지 그리고 그때의 `x` 값을 구하라.

이때 세가지 초기치로 `x1 = 0`, `x2 = 4`, `x3 = 2`를 활용하라. (단, 문제에서 요구한 code를 작성하지 못한 경우에는 Matlab이 제공하는 built-in function를 활용하여 같은 결과를 구하라)

```text
f(x) = x^2 / 10 - 2 * sin(x)
```

See [Sol. 2](./sol02/solve.m)
