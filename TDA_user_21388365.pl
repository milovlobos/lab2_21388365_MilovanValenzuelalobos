consult('TDA_option_213883658.pl').

%tda user
% tipo:selector
% Predicado:
% Dominio:
% Meta:
%
% % tipo:selector
% Predicado:
% Dominio:
% Meta:

% tipo:selector
% Predicado:
% Dominio:
% Meta:

% tipo:selector
% Predicado:
% Dominio:
% Meta:

%
% clausulas


systemAddUser(S, U, NS) :-
    system_user(S,US),
     system_name(S,N),
      system_codec(S,CO),
       system_chatbots(S,C),
        system_userlog(S,L),
    (   member(U, US)
    ->  NS = S
    ;   add_to_end(U, US, NUS),
        system(N,CO,C,NUS,L,NS) ).

systemLogin(S, U, NS) :-
    system_user(S, US),
    system_userlog(S, L),
    system_name(S, N),
    system_codec(S, CO),
    system_chatbots(S, C),
    (member(U, US), es_vacia(L) ->
        NL = [U],
        writeln('Sesión iniciada con éxito.'),
        system(N, CO, C, US, NL, NS)
    ;
    (\+ member(U, US) ->
        writeln('No existe el usuario'),
        NS = S
    ;
    (\+ es_vacia(L) ->
        writeln('Ya hay una sesión iniciada.'),
        NS = S ))).
systemLogout(S, NS) :-
    system_user(S, US),
    system_userlog(S, L),
    system_name(S, N),
    system_codec(S, CO),
    system_chatbots(S, C),
    (   \+ es_vacia(L) ->
        NL = [],
        writeln('Sesión cerrada.'),
        system(N, CO, C, US, NL, NS)
    ;
    (   es_vacia(L) ->
        writeln('No existe una sesión iniciada.'),
        NS = S
    )).


