% nextto(X, Y, List) — истина, если X стоит перед (слева от) Y в списке List
nextto(L, R, [L, R | _]).
nextto(L, R, [_ | Rest]) :- nextto(L, R, Rest).

% neighbors(X, Y, List) - истина, если 2 элемента в списке рядом друг с другом (соседи, т.е., либо X слева от Y, либо наоборот)
neighbors(X, Y, List) :- nextto(X, Y, List).
neighbors(X, Y, List) :- nextto(Y, X, List).

