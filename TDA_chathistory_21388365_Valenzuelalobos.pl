:-consult('TDA_extras_21388365_Valenzuelalobos.pl').

%tda
% tipo:
% predicado:systemTalkRec
% Dominio:system(Lista) X message (string) X system(Lista)
% Meta:Predicado que permite interactuar con un chatbot.

% tipo:
% predicado:systemSynthesis
% Dominio:system(Lista) X usuario (String) X string
% Meta:ofrece una síntesis del chatbot para un usuario particular  a partir de chatHistory contenido dentro del sistema

% tipo:
% predicado:systemSimulate
% Dominio:system(Lista) X maxInteractions (int) X seed (int) X system(Lista)
% Meta:Permite simular un diálogo entre dos chatbots del sistema.



%clausulas

systemTalkRec(S, _, NS) :-
    NS = S,
    writeln('no realice la funcion systemTalkRec').

systemSynthesis(_,_,_):- writeln("no realice la funcion systemSynthesis").

systemSimulate(S,_,_,NS):- NS=S, writeln("no realice la funcion systemSimulate").
