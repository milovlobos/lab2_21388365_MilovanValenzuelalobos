%tda extras
% tipo
% nombre:remove_element(elemto,lista,result)
% Dominio:elemto,lista
%Recorrido:resultado(lista)
% Meta:eleminar el elemnto de la lista y entregar result el cual es una
% nueva lista sin el elemento
% metodo:recursividad natural




%clausulas

remove_element(_, [], []). %caso base
remove_element(Element, [Element | Tail], Result) :-
    remove_element(Element, Tail, Result). %Elimina todas las ocurrencias del elemento de la cabeza de la lista.
remove_element(Element, [Head | Tail], [Head | NewTail]) :-
    Element \== Head,
    remove_element(Element, Tail, NewTail).%Conserva la cabeza de la lista si no coincide con el elemento a eliminar




