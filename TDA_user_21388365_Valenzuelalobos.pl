:-consult('TDA_system_21388365_Valenzuelalobos.pl').
:-consult('TDA_extras_21388365_Valenzuelalobos.pl').

%tda user
% tipo:contructor
% Predicado:systemAddUser(System,user,newsystem)
% Dominio:system(lista),user(string),newsystem(lista)
% Meta:agregar usuarios a un sitema sin que existen repetidos.
%
% % tipo:modificador
% Predicado:systemLogin(system,user,newsystem)
% Dominio:system(lista),user(string),newsystem(lista)
% Meta:iniciar sesion con un usuario existente dentro del sistema

% tipo:modificador
% Predicado:systemLogout(system,newsystem)
% Dominio:system(lista),newsystem(lista)
% Meta:cerrar sesion dentro de un sistema

% tipo:
% Predicado:es_vacia([])
% Dominio:lista es_vacia
% Meta:ver si una lista es vacia


%
% clausulas



systemAddUser(S, U, NS) :-
    system_user(S,US),
    system_name(S,N),
    system_codec(S,CO),
    system_chatbots(S,C),
    system_userlog(S,L),
    \+member(U, US),
    add_to_end(U, US, NUS),
    system(N,CO,C,NUS,L,NS) .

systemLogin(S, U, NS) :-
    system_user(S, US),
    system_userlog(S, L),
    system_name(S, N),
    system_codec(S, CO),
    system_chatbots(S, C),
    member(U, US), 
    es_vacia(L) ,
    NL = [U],
    writeln('Sesion iniciada con exito.'),
    system(N, CO, C, US, NL, NS).
   

systemLogout(S, NS) :-
    system_user(S, US),
    system_userlog(S, L),
    system_name(S, N),
    system_codec(S, CO),
    system_chatbots(S, C),
     \+ es_vacia(L),
        NL = [],
        writeln('Sesion cerrada.'),
        system(N, CO, C, US, NL, NS).

es_vacia([]).
