%tda
% tipo:selector
% nombre:
% Dominio:
%Recorrido:
% Meta:
%
% %tda
% tipo:selector
% nombre:
consult('TDA_option_213883658.pl').

% Dominio:
%Recorrido:
% Meta:

%tda
% tipo:selector
% nombre:
% Dominio:
%Recorrido:
% Meta:

%tda
% tipo:selector
% nombre:
% Dominio:
%Recorrido:
% Meta:

%tda
% tipo:selector
% nombre:
% Dominio:
%Recorrido:
% Meta:

%clausulas
%
chatbot(I,N,WM,SF,F,[I,N,WM,SF,F]).
chatbot_id([I,_,_,_,_],I).
chatbot_flows([_, _, _, _, Flows], Flows).


chatbotAddFlow(Flow, [ChatbotID, Name, WelcomeMessage, StartFlowID, Flows], NewChatbot):-
    flow_id(Flow, FlowID),
    (flow_id_existe(FlowID, Flows) ->
        chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, Flows,NewChatbot) ; % El flujo ya existe, no se agrega
        add_to_end(Flow, Flows, NewFlows),
        chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, NewFlows,NewChatbot)
    ).

flow_id_existe(ID, [F | _]):- flow_id(F,I),ID=I.
flow_id_existe(ID, [_ | Rest]) :-



