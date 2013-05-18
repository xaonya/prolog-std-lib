% В этом файле содержатся функции, и так определённые в стандартной реализации GNU Prolog.
% Использовать только если ваша реализация Prolog отличается

% member(Elem, List) — истина, если элемент Elem есть в списке List
member(X, [X | _]).
member(X, [_ | Rest]) :- member(X, Rest).

% nth(N, List, Elem) — истина, если элемент Elem в списке List стоит на N-й (счет начинается с 1) позиции
nth(1, [Elem | _], Elem).
nth(N, [_ | Rest], Elem) :- N > 1, K is N-1, nth(K, Rest, Elem).
