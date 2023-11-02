consult('TDA_option_213883658.pl').

%tda
% tipo:contructor
% predicado:system(name,InitialChatbotCodeLink ,chatbots,system)
% Dominio:Name(string),InitialChatbotCodeLink(number),Chatbots(lista de
% chatbots),system.

% Meta:constructor de un sistema de chatbots.
%
% % tipo:selector
% nombre:
% Dominio:
%Recorrido:
% Meta:

% tipo:selector
% nombre:
% Dominio:
%Recorrido:
% Meta:

% tipo:selector
% nombre:
% Dominio:
%Recorrido:
% Meta:

% tipo:selector
% nombre:
% Dominio:
%Recorrido:
% Meta:


% tipo:selector
% nombre:
% Dominio:
%Recorrido:
% Meta:

%clausulas

system(N,IC,C,[N,IC,C]).
system_chatbots([_,_,C|_],C).
system_name([N,_,_|_],N).
system_codec([_,CO,_|_],CO).

systemAddChatbot(S,C,NS):-
    system_chatbots(S,CT),
    chatbot_id(C,ID),
    system_name(S,N),
    system_codec(S,CO),
     (chatbot_id_existe(ID, CT) ->
        system(N,CO,CT,NS) ;
        add_to_end(C, CT, Newchatbots),
        system(N,CO, Newchatbots,NS)).

chatbot_id_existe(ID,[C|_]):-
                  chatbot_id(C,I),
                  ID=I.
chatbot_id_existe(ID,[_|Rest]):-
    chatbot_id_existe(ID,Rest).

