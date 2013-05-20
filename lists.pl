% nextto(X, Y, List) — истина, если X стоит перед (слева от) Y в списке List
nextto(L, R, [L, R | _]).
nextto(L, R, [_ | Rest]) :- nextto(L, R, Rest).

% neighbors(X, Y, List) - истина, если 2 элемента в списке рядом друг с другом (соседи, т.е., либо X слева от Y, либо наоборот)
neighbors(X, Y, List) :- nextto(X, Y, List).
neighbors(X, Y, List) :- nextto(Y, X, List).

% add(X, List1, List2) - добавление элемента X в начало List1.
add(X, List, [X | List]). % (По сути, смысла в этой процедуре нет)

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
