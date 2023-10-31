%predicado
%option(code,message , ChatbotCodeLink ,InitialFlowCodeLink , Keyword , Option)
%flow(Id, Name, option ,flow)
%flowaddoption(flow,optiom,flow)
%chatbot(chatbotID, name , welcomeMessage ,startFlowId ,flows,chabot)
% system(name,InitialChatbotCodeLink ,chatbots,system)
%
%comillas'hola'
% consultas
% option(1,hola,2,2,[hola,chao],O1),option(2,chao,2,2,[hola,chao],O2),flow(1,pepe,[O1],F1),flowaddoption(O2,F1,F2),flowaddoption(O1,F2,F3),flow(2,pedrp,[F1],F4),chatbot(1,prueba,bienvenido,0,[F3],C1),chatbotAddFlow(F4,C1,C2),chatbotAddFlow(F3,C2,C3).
% swipl -s tu_programa.pl -g ?- > salida.txt
% contructores
option(C, M, CH, I, K, [C, M, CH, I, K]).

flow(I,N,O,[I,N,O]).

chatbot(I,N,WM,SF,F,[I,N,WM,SF,F]).

system(N,IC,C,[N,IC,C]).

%
% Predicado para obtener el código de una opción
option_code([Code, _, _, _, _], Code).

flow_id([I,_,_],I).
chatbot_id([I,_,_,_,_],I).


%modificadores

flowaddoption(Option, [Id, Name, Options], NewList) :-
    option_code(Option, Code),                % Obtiene el código de la nueva opción
    \+ option_code_exists(Code, Options),     % Verifica si el código de la nueva opción no existe en la lista actual
    NewOptions = [Option | Options],         % Agrega la nueva opción al principio de la lista de opciones
    NewList = [Id, Name, NewOptions].         % Construye la nueva lista con la opción agregada


% Predicado para verificar si un código de opción ya existe en la lista de opciones
option_code_exists(Code, Options) :-
    member([ExistingCode, _, _, _, _], Options),  % Extrae el código de cada opción en Options
    ExistingCode = Code.
flowaddoption(_, OriginalList, OriginalList). % en caso de no poder agregar la nueva opcion ya que ya existe su codigo retorna la lista original

%chatbotAddFlow

chatbotAddFow(Flow, Chatbot, NewChatbot) :-
    chatbot_flows(Chatbot, Flows),            % Obtiene la lista de flujos actual de un chatbot
    flow_id(Flow, FlowID),                    % Obtiene el ID del nuevo flujo
    \+ flow_id_exists(FlowID, Flows),         % Verifica si el ID del flujo no existe en la lista actual de flujos
    add_flow_to_end(Flow, Flows, NewFlows),    % Agrega el nuevo flujo al final de la lista de flujos
    NewChatbot = (ChatbotID, Name, WelcomeMessage, StartFlowID, NewFlows).
chatbotAddFlow(_, Chatbot, Chatbot).  % En caso de que no se pueda agregar el flujo, se devuelve el chatbot original.

% Predicado para agregar un flujo al final de la lista de flujos
add_flow_to_end(Flow, [], [Flow]).  % Caso base: si la lista está vacía, agrega el flujo al final.
add_flow_to_end(Flow, [H | T], [H | NewTail]) :-
    add_flow_to_end(Flow, T, NewTail).

% Predicado para obtener la lista de flujos de un chatbot
chatbot_flows((_, _, _, _, Flows), Flows).

% Predicado para verificar si un ID de flujo ya existe en la lista de flujos
flow_id_exists(ID, Flows) :-
    member([ID, _, _], Flows). % Extrae el ID de cada flujo en Flows
