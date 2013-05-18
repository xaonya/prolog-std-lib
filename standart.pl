% В этом файле содержатся функции, и так определённые в стандартной реализации GNU Prolog.
% Использовать только если ваша реализация Prolog отличается

% member(Elem, List) — истина, если элемент Elem есть в списке List
member(X, [X | _]).
member(X, [_ | Rest]) :- member(X, Rest).

% nth(N, List, Elem) — истина, если элемент Elem в списке List стоит на N-й (счет начинается с 1) позиции
nth(1, [Elem | _], Elem).
nth(N, [_ | Rest], Elem) :- N > 1, K is N-1, nth(K, Rest, Elem).

% length(List, N) - длинна списка List
length([], 0).
length([_ | Tail], N) :- length(Tail, N1), N is N1 + 1.

% append(List1, List2, List3) - процедура объединения списков L1 и L2
append([], L, L).
append([X | List1], List2, [X | List3]) :- append(List1, List2, List3).

% last - последний элемент в списке List
last(List, X) :- append(_, [X], List).

% reverse(List, ReversedList) - вернёт элементы List в обратном порядке
reverse([], []).
reverse([X| Tail], List) :- reverse(Tail, Temp), append(Temp, [X], List).

% permutation(List1, List2) - List2 - всевозможные перестановки элементов List1
permutation([], []).
permutation(List, [Head | Tail]) :- append(V, [Head|U], List), append(V, U, W), permutation(W, Tail). 

% sublist(s, List) - является ли список s подсписокм списка List
sublist(s, List) :- concat(List1, List2, List), concat(s, List3, List2). % можно ли разложить List на List1 и List2, так что s является началом List2, а некоторый List3 его концом

