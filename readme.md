# Библиотека стандартных функций для начинающих изучать Prolog.

## Разделы

 * `lists.pl` - файл, содержащий функции для работы со списками
 * `math.pl` - файл, содержащий различные математические функции
 
 * `init.pl` - файл содержащий инструкции по установке, возможно 
 
## Инструкция по подключению
Первое, что вам нужно сделать для того, чтобы использовать библиотеку, это указать директорию, где она расположена, чтобы интерпретатор мог обработать файлы с ней
	change_directory('Путь/до/библиотеки/prolog-std-lib').

_Внимание!_
если у вас реализация языка отличается от GNU Prolog, то перед подключением библиотеки необходимо подключить стандартные функции

	consult('standart.pl').

Скопируйте строки из этого блока в окно интерпретатора, чтобы подключить всю библиотеку

	consult('math.pl'). % математические функции
	consult('lists.pl'). % работа со списками

## Описание функций

### Работа со списками (lists.pl)
 * `nextto(X, Y, List)` — истина, если X стоит перед (слева от) Y в списке List
 * `neighbors(X, Y, List)` - истина, если 2 элемента в списке рядом друг с другом (соседи, т.е., либо X слева от Y, либо наоборот)
 * `add(X, List1, List2)` - добавление элемента X в начало List1.
 * `addOnce(X, List1, List2)`  - Добавление элемента X в начало списка List1, но только если его там нет
 * `del(X, List, List1)` - удаление элемента X из списка List
 * `insertTo(X, List1, List2)` вставки элемента X в любом месте некоторого списка List1 (вернёт несколько результатов - каким бы мог быть список List2 до удаления из него X)
 * `palindrome(List)` - верно, если список читается одинково слева-направо и справа-налево, например [1,2,2,1]
 * `evenlength(List)` - верно, если в списке чётное количество элементов
 * `oddlength(List)` - верно, если в списке нечётное количество элементов
 * `remove(List1, Index, List2)` - List2 получается удалением из List1 элемента с номером Index.
 * `subset(List1, List2)` - верно, если множество, состоящее из элементов List1 является подмножеством множества, состоящего из элементов List2
 * `moveleft(List1, List2)` - сдвиг элементов списка List1 влево на один, первый элемент же становится последним
 * `moveright(List1, List2)` - сдвиг элементов списка List1 вправо на один, последний элемент же становится первым
 * `sorted(List)` Проверка того, что список List "отсортирован" по возрастанию
 * `nativeSort(List1, List2)` - "Наивная сортировка" (переставляем все элементы до тех пор, пока список не отсортируется)
 * `swap(List1, List2)' - Обмен местами двух смежных элементов списка List1, если они не отсортированы
 * `bubbleSort(List, SList)` - Пузырьковая сортировка
 * `insertSort(List1, List2)` - Сортировка вставками
 * `split(X, List, Small, Big)` - Разбиение списка List на 2 списка Small и Big, таких что в одном списке элементы меньше X, а в другом больше X
 * `quickSort(List1, List2)` -  Быстрая сортировка
 * `dividelist(List, List1, List2)` - Элементы списка List распределяются в списках List1 и List2 таким образом, что их длинна примерно одинкова

### Работа с математикой (math.pl)
 * `order(X, Y)` - Верно, если Y >= X
 * `minimum(X, Y, M)` - M - минимальный элемент среди X и Y
 * `maximum(X, Y, M)` - M - максимальный элемент среди X и Y
 * `factorial(N,F)` - процедура вычисления факториала числа N
 * `fibonacci(N, F)` - вычисляет N-е число последовательности Фибоначчи
 * `equation2(A, B, C, X)` - решение квадратного уравнения

----------

### реализация стандартных функциий (standart.pl)
 * `member(Elem, List)` — истина, если элемент Elem есть в списке List
 * `nth(N, List, Elem)` — истина, если элемент Elem в списке List стоит на N-й (счет начинается с 1) позиции
 * `length(List, N)` - длинна списка List
 * `append(List1, List2, List3)` - процедура объединения списков L1 и L2
 * `last(List, X)` - последний элемент в списке List
 * `reverse(List, ReversedList)` - вернёт элементы List в обратном порядке
 * `permutation(List1, List2)` - List2 - всевозможные перестановки элементов List1
 * `sublist(s, List)` - является ли список s подсписокм списка List
 * `flatten(List, FlatList)` - приводит список списков List к списку элементов первого уровня
