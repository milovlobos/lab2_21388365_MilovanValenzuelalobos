:-consult('TDA_extras_21388365_Valenzuelalobos.pl').
:-consult('TDA_flow_21388365_Valenzuelalobos.pl').

%tda
% tipo:contructor
% predicado:chatbot(chatbotID, name , welcomeMessage ,startFlowId ,flows,chabot)
% Dominio:chatbotID(number), name(string) , welcomeMessage(string) startFlowId(number) ,flows(lista de flujos),chabot(chatbot)
% Meta:predicado contructor de un chatbot
%
%
% tipo:selector
% predicado:chatbot_id(chatbot,ID).
% Dominio:Chatbot (chatbot),Id(number)
% Meta:obtener el id de chatbot

%
% tipo:selector
% predicado:chatbot_flows(chatbot, Flows)
% Dominio:chatbot,flows(lista de flujos)
% Meta:obtener la lista de flujos de un chatbot

% tipo:selector
% predicado:chatbot_name(chatbot, Name)
% Dominio:chatbot(lista),NAME(string)
% Meta:obtener el nombre de un chabot

% tipo:selector
% predicado:chatbot_message(chatbot, welcomeMessage)
% Dominio:chatbot(lista), welcomeMessage(string)
% Meta:obtener el mensaje de un chatbot

% tipo:selector
% predicado:chatbot_flowid(chatbot, StartFlowID)
% Dominio:chatbot(lista), startFlowId(number)
% Meta:obtener el startFlowId de un chatbot

%
% tipo:modificador
% Predicado:chatbotAddFlow
% Dominio:flow(flujo),chatbot,newchatbot(chatbot con el flujo a�adido
% en caso que se pudo)
% Meta:modificador para a�adir flujos a un chatbot.


%
% tipo:pertenencia
% Predicado:flow_id_exist(ID,Flows)
% Dominio:ID(number),Flows(lista de flujos)
% Meta:verificar si ya existe un id dentro de una lista de flujos
%recursion:Recursion natural
%clausulas
%
chatbot(I,N,WM,SF,F,[I,N,WM,SF,F]).
chatbot_id([I,_,_,_,_],I).
chatbot_flows([_, _, _, _, Flows], Flows).
chabot_name([_,N,_,_,_],N).
chatbot_message([_,_,M,_,_],M).
chatbot_flowid([_,_,_,SF,_],SF).


chatbotAddFlow(Chatbot,Flow,NewChatbot):-
    chabot_name(Chatbot,Name),
    chatbot_message(Chatbot,WelcomeMessage),
    chatbot_flowid(Chatbot,StartFlowID),
    chatbot_flows(Chatbot,Flows),
    chatbot_id(Chatbot,ChatbotID),
    flow_id(Flow, FlowID),
    \+ flow_id_existe(FlowID, Flows),
    add_to_end(Flow, Flows, NewFlows),
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, NewFlows,NewChatbot).

flow_id_existe(ID, [F | _]):- flow_id(F,I),ID=I.
flow_id_existe(ID, [_ | Rest]) :-



