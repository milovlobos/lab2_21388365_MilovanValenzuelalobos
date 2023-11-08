%tda extras
% tipo:
% Predicado:remove_element(elemento,lista,result)
% Dominio:elemento(dato),lista(lista),result(lista)
% Meta:eleminar el elemnto de la lista y entregar result el cual es una nueva lista sin el elemento
% metodo:recursividad natural


% tipo:
% Predicado:add_to_end(elemento,lista,result)
% Dominio:elemento(dato),lista(lista),result(lista)
% Meta:Agregar elemento al final de una lista y entregar la nueva lista con el dato al final 

% metodo:recursividad natural


% Predicado:eliminar_repetidos(lista,result)
% Dominio:lista(lista),result(lista)
% Meta:eliminar elemento repetidos dentro de una lista
%
% metodo:recursividad natural




%clausulas

remove_element(_, [], []). %caso base
remove_element(Element, [Element | Tail], Result) :-
    remove_element(Element, Tail, Result). %Elimina todas las ocurrencias del elemento de la cabeza de la lista.
remove_element(Element, [Head | Tail], [Head | NewTail]) :-
    Element \== Head,
    remove_element(Element, Tail, NewTail).%Conserva la cabeza de la lista si no coincide con el elemento a eliminar

add_to_end(C, [], [C]).  % Caso base: si la lista esta vacia, agrega el flujo al final.
add_to_end(C, [H | T], [H | NewTail]) :-
    add_to_end(C,T, NewTail).


eliminar_repetidos([], []).
eliminar_repetidos([X|Xs], Ys) :-
    eliminar_repetidos(Xs, Ys),
    (member(X, Ys) ; (is_list(X), member(X, Ys))), !.
eliminar_repetidos([X|Xs], [X|Ys]) :-
    eliminar_repetidos(Xs, Ys).

