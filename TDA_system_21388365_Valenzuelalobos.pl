:-consult('TDA_extras_21388365_Valenzuelalobos.pl').
:-consult('TDA_chatbot_21388365_Valenzuelalobos.pl').

%tda
% tipo:contructor
% predicado:system(name,InitialChatbotCodeLink ,chatbots,system)
% Dominio:Name(string),InitialChatbotCodeLink(number),Chatbots(lista de
% chatbots),system(lista).
% Meta:constructor de un sistema de chatbots.
%
% % tipo:contructor
% predicado:system(name,InitialChatbotCodeLink,chabot,users,userlog,newsystem)
% Dominio:name(string),InitialChatbotCodeLink(number),chabot(lista),users(lista),userlog(lista),newsystem(lista)
% Meta:contructor de un sistema con una lista de usuarios existentes y un userlog que indicara el usuario que se encuentra en secion 

% tipo:selector
% predicado:system_chatbots(system,chabots)
% Dominio:system(lista),chabots(lista)
% Meta:obtener lista de chatbots de un sistema

% tipo:selector
% predicado:system_name(system, name )
% Dominio:system(lista), name(string)
% Meta:obtener el nombre de un sistema

% tipo:selector
% predicado:system_codec(system,Code)
% Dominio:system(lista),code(number)
% Meta:obtener el InitialChatbotCodeLink de un sistema


% tipo:selector
% predicado:system_user(system,users)
% Dominio:system(lista),user(lista)
% Meta:obtener lista de usuarios de un sistema

% tipo:selector
% predicado:system_userlog(system,userlog)
% Dominio:system(lista),userlog(lista de un elemento)
% Meta:obtener usuario en sesion de un sistema

% tipo:modificador
% predicado:systemAddChatbot(system,chatbot,newsystem)
% Dominio:system(lista),chatbot(lista),newsystem(lista)
% Meta:agregar chatbot a un sistema evitando duplicidad segun  su id 

% tipo:
% predicado:chatbot_id_existe(chatbot,chabots)
% Dominio:chabot(lista),chabots(lista)
% Meta:verificarsi existe id de un chabot en una lista de chabots



%clausulas
system(N,IC,C,[N,IC,C,[],[]]).

system(N,IC,C,US,L,[N,IC,C,US,L]).

system_chatbots([_,_,C,_,_],C).

system_name([N,_,_,_,_],N).

system_codec([_,CO,_,_,_],CO).

system_user([_,_,_,U,_],U).

system_userlog([_,_,_,_,L],L).

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

