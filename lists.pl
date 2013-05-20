% nextto(X, Y, List) — истина, если X стоит перед (слева от) Y в списке List
nextto(L, R, [L, R | _]).
nextto(L, R, [_ | Rest]) :- nextto(L, R, Rest).

% neighbors(X, Y, List) - истина, если 2 элемента в списке рядом друг с другом (соседи, т.е., либо X слева от Y, либо наоборот)
neighbors(X, Y, List) :- nextto(X, Y, List).
neighbors(X, Y, List) :- nextto(Y, X, List).

% add(X, List1, List2) - добавление элемента X в начало List1.
add(X, List, [X | List]). % (По сути, смысла в этой процедуре нет)

% addOnce(X, List1, List2)  - Добавление элемента X в начало списка List1, но только если его там нет
addOnce(X, List, List) :- member(X, List), !. add(X, List, [X | List]).

% del(X, List, List1) - удаление элемента X из списка List
del(X, [X | Tail], Tail).
del(X, [Y | Tail], [Y | Tail1]) :- del(X, Tail, Tail1).

% insertTo(X, List1, List2) вставки элемента X в любом месте некоторого списка List1 (вернёт несколько результатов - каким бы мог быть список List2 до удаления из него X)
insertTo(X, List1, List2) :- del(X, List2, List1).

% palindrome(List) - верно, если список читается одинково слева-направо и справа-налево, например [1,2,2,1]
palindrome(List) :- reverse(List, List).

% evenlength(List) - верно, если в списке чётное количество элементов
evenlength(List) :- length(List, N), 1 is N mod 2.

% oddlength(List) - верно, если в списке нечётное количество элементов
oddlength(List) :- length(List, N), 0 is N mod 2.

% remove(List1, Index, List2) - List2 получается удалением из List1 элемента с номером Index.
remove([_ | Tail], 1, Tail).
remove([X | Tail], N, [X | List]) :- N1 is N-1, remove(Tail, N1, List).

% moveleft(List1, List2) - сдвиг элементов списка List1 влево на один, первый элемент же становится последним
moveleft([], []).
moveleft([X | Tile], List) :- append(Tile, [X], List).

% moveright(List1, List2) - сдвиг элементов списка List1 вправо на один, последний элемент же становится первым
moveright([], []).
moveright(List, [X | Tail]):- length(List, N), last(List, X), remove(List, N, Tail).

% order(X, Y) :- Верно, если Y >= X
order(X, Y) :- X =< Y.

% Проверка того, что список "отсортирован" по возрастанию
sorted([L]).
sorted([X, Y | Tail]) :- order(X, Y), sorted([Y | Tail]).

% "Наивная сортировка" (переставляем все элементы до тех пор, пока список не отсортируется)
nativeSort(List1, List2) :- permutation(List1, List2), sorted(List2), !.

% Обмен местами двух смежных элементов списка, если они не отсортированы
swap([X, Y|R], [Y, X|R]) :- order(Y, X).
swap([X|R], [X|R1]) :- swap(R, R1).

% Пузырьковая сортировка
bubbleSort(L, S) :- swap(L, M), !, bubbleSort(M, S). 
bubbleSort(L, L) :- !. 

% Сортировка вставками
insertSort([], []).
insertSort([X|L], M) :- insertSort(L, N), insertSortx(X, N, M).
insertSortx(X, [A|L], [A|M]) :- order(A, X), !, insertSortx(X, L, M).
insertSortx(X, L, [X|L]).

% Разбиение списка на 2, таких что в одном списке элементы больше X, а в другом меньше X
split(H, [A|Tail], [A|Small], Big) :- order(A, H), !, split(H, Tail, Small, Big).
split(H, [A|Tail], Small, [A|Big]) :- split(H, Tail, Small, Big).
split(_, [], [], []).

% Быстрая сортировка
qsort([], []).
qsort([H|Tail], S) :- split(H, Tail, Small, Big), qsort(Small, Small1), qsort(Big, Big1), append(Small1, [H|Big1], S).
