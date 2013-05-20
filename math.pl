% minimum(X, Y, M) - M - минимальный элемент среди X и Y
minimum(X, Y, X) :- X < Y.
minimum(X, Y, Y) :- Y >= X.

% maximum(X, Y, M) - M - максимальный элемент среди X и Y
maximum(X, Y, X) :- X >= Y.
maximum(X, Y, Y) :- Y < X.

% factorial(N,F) - процедура вычисления факториала числа N
factorial(0,1).
factorial(N,F) :- N>0, N1 is N-1, factorial(N1,F1), F is F1 * N.

% fibonacci(N, F) - вычисляет N-е число последовательности Фибоначчи
fibonacci(0,1).
fibonacci(1,1).
fibonacci(N,F) :- N > 1, N1 is N - 2, N2 is N - 1, fibonacci(N1,P1), fibonacci(N2,P2), F is P1 + P2.

% equation2(A, B, C, X) - решение квадратного уравнения
equation2(0,B,C,X) :- X is -C / B.
equation2(A,B,C,X) :- X=[X1,X2], D is B*B-4*A*C, (
  D>=0, X1 is (-B+sqrt(D))/2/A, X2 is (-B-sqrt(D))/2/A;
  R is -B/2/A, D1 is -D, I1 is abs(sqrt(D1)/2/A), I2 is -I1, X1=[R,I1], X2=[R,I2]
).
