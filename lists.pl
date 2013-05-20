% nextto(X, Y, List) — истина, если X стоит перед (слева от) Y в списке List
nextto(L, R, [L, R | _]).
nextto(L, R, [_ | Rest]) :- nextto(L, R, Rest).

% neighbors(X, Y, List) - истина, если 2 элемента в списке рядом друг с другом (соседи, т.е., либо X слева от Y, либо наоборот)
neighbors(X, Y, List) :- nextto(X, Y, List).
neighbors(X, Y, List) :- nextto(Y, X, List).

% add(X, List1, List2) - добавление элемента X в начало List1.
add(X, List, [X | List]). % (По сути, смысла в этой процедуре нет)

% addOnce(X, List1, List2)  - Добавление элемента X в начало списка List1, но только если его там нет
addOnce(X, List, List) :- member(X, List), !. addOnce(X, List, [X | List]).

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

% subset(List1, List2) - верно, если множество, состоящее из элементов List1 является подмножеством множества, состоящего из элементов List2
subset([], _).
subset([X|Tail], List) :- member(X, List), del(X, List, List1), subset(Tail, List1).

% moveleft(List1, List2) - сдвиг элементов списка List1 влево на один, первый элемент же становится последним
moveleft([], []).
moveleft([X | Tile], List) :- append(Tile, [X], List).

% moveright(List1, List2) - сдвиг элементов списка List1 вправо на один, последний элемент же становится первым
moveright([], []).
moveright(List, [X | Tail]):- length(List, N), last(List, X), remove(List, N, Tail).

% sorted(List) Проверка того, что список List "отсортирован" по возрастанию
sorted([_]).
sorted([X, Y | Tail]) :- order(X, Y), sorted([Y | Tail]).

% nativeSort(List1, List2) - "Наивная сортировка" (переставляем все элементы до тех пор, пока список не отсортируется)
nativeSort(List1, List2) :- permutation(List1, List2), sorted(List2), !.

% swap(List1, List2) - Обмен местами двух смежных элементов списка List1, если они не отсортированы
swap([X, Y | R], [Y, X | R]) :- order(Y, X).
swap([X | R], [X | R1]) :- swap(R, R1).

% bubbleSort(List, SList) - Пузырьковая сортировка
bubbleSort(List, SList) :- swap(List, MList), !, bubbleSort(MList, SList). 
bubbleSort(List, List) :- !. 

% insertSort(List1, List2) - Сортировка вставками
insertSort([], []).
insertSort([X | L], M) :- insertSort(L, N), insertSortx(X, N, M).
insertSortx(X, [A | L], [A|M]) :- order(A, X), !, insertSortx(X, L, M).
insertSortx(X, L, [X | L]).

% split(X, List, Small, Big) - Разбиение списка List на 2 списка Small и Big, таких что в одном списке элементы меньше X, а в другом больше X
split(X, [A | Tail], [A | Small], Big) :- order(A, X), !, split(X, Tail, Small, Big).
split(X, [A | Tail], Small, [A | Big]) :- split(X, Tail, Small, Big).
split(_, [], [], []).

% quickSort(List1, List2) -  Быстрая сортировка
quickSort([], []).
quickSort([H|Tail], S) :- split(H, Tail, Small, Big), quickSort(Small, Small1), quickSort(Big, Big1), append(Small1, [H|Big1], S).

% dividelist(List, List1, List2) - Элементы списка List распределяются в списках List1 и List2 таким образом, что их длинна примерно одинкова
dividelist([], [], []).
dividelist([X | Tail],[X | List1], List2) :- oddlength(Tail), !, dividelist(Tail, List1, List2).
dividelist([X | Tail], List1, [X | List2]) :- evenlength(Tail), dividelist(Tail, List1, List2).
