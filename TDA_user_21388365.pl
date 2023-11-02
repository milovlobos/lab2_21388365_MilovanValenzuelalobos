consult('TDA_option_213883658.pl').

%tda user
% tipo:selector
% nombre:
% Dominio:
%Recorrido:
% Meta:
%
% clausulas

systemAddUser(S, U, NS) :-
    (   member(U, S)
    ->  NS = S
    ;   add_to_end(U, S, NS)
    ).

systemLogin(S, U, NS) :-
    (member(U, S), \+ member(login, S)) ->
    (add_to_end(login, S, NS), writeln('Sesión iniciada con éxito.'));
    (\+ member(U,S)-> writeln('no existe el usuario'), NS = S);
    (member(login,S)-> writeln('Ya hay una sesión iniciada.'), NS = S).

systemLogout(S,NS):-
    (   member(login,S)->remove_element(login,S,NS),writeln('sesion cerrada.'));
    (   \+ member(login,S)-> writeln('no existe una sesion iniciada'),NS=S).

