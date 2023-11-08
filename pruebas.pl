%consult('TDA_option_213883658.pl').
%predicado
%Option(Code,Message , ChatbotCodeLink ,InitialFlowCodeLink , Keyword , Option)
%flow(Id, Name, option ,flow)
%flowaddoption(flow,optiom,flow)
%chatbot(chatbotID, name , welcomeMessage ,startFlowId ,flows,chabot)
% system(name,InitialChatbotCodeLink ,chatbots,system)
%SystemAddUser(system,user,system)
%systemLogin(system,user,system)
%comillas'hola'
% consultas
%   option(1,hola,3,3,[hola,chao],O1),option(3,chao,3,3,[hola,chao],O2),flow(1,pepe,[O1,O1],F1),flowaddoption(O2,F1,F2),flowaddoption(O1,F2,F3),flow(2,pedrp,[],F4),chatbot(1,prueba,bienvenido,0,[F4,F4],C1),chatbotAddFlow(F3,C1,C2),system(sistemap,0,[C1,C1],S1),systemAddUser(S1,milo,S2),systemAddUser(S2,mil,S3),systemLogin(S3,milo,S4),systemLogin(S4,mil,S5),systemLogout(S5,S6),systemLogout(S6,S7).
% utilidades
%
remove_element(_, [], []).
remove_element(Element, [Element | Tail], Result) :-
    remove_element(Element, Tail, Result).
remove_element(Element, [Head | Tail], [Head | NewTail]) :-
    Element \== Head,
    remove_element(Element, Tail, NewTail).
es_vacia([]).

% contructores
option(C, M, CH, I, K, [C, M, CH, I, K]).

flow(I,N,O,[I,N,OS]):- eliminar_repetidos(O,OS).

chatbot(I,N,WM,SF,F,[I,N,WM,SF,FS]):- eliminar_repetidos(F,FS).

system(N,IC,C,[N,IC,CS,[],[]]):- eliminar_repetidos(C,CS).
system(N,IC,C,US,L,[N,IC,C,US,L]).

%
% Predicado para obtener el codigo de una opcion
option_code([Code, _, _, _, _], Code).

flow_id([I,_,_],I).
chatbot_id([I,_,_,_,_],I).
system_chatbots([_,_,C,_,_],C).
system_name([N,_,_,_,_],N).
system_codec([_,CO,_,_,_],CO).
system_user([_,_,_,U,_],U).
system_userlog([_,_,_,_,L],L).



%modificadores
flowaddoption(Option, [Id, Name, Options], NewList) :-
    option_code(Option, Code),                % Obtiene el codigo de la nueva opcion
    \+ option_code_exists(Code, Options),     % Verifica si el codigo de la nueva opcion no existe en la lista actual
    NewOptions = [Option | Options],         % Agrega la nueva opcion al principio de la lista de opciones
    flow(Id, Name, NewOptions,NewList).         % Construye la nueva lista con la opcopn agregada


% Predicado para verificar si un codigo de opcion ya existe en la
% lista de opciones
option_code_exists(Code, Options) :-
    member([ExistingCode, _, _, _, _], Options),  % Extrae el codigo de cada opcion en Options
    ExistingCode = Code.
flowaddoption(_, OriginalList, OriginalList). % en caso de no poder agregar la nueva opcion ya que ya existe su codigo retorna la lista original

%chatbotAddFlow

chatbotAddFlow(Flow, [ChatbotID, Name, WelcomeMessage, StartFlowID, Flows], NewChatbot):-
    flow_id(Flow, FlowID),
    (flow_id_existe(FlowID, Flows) ->
        chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, Flows,NewChatbot) ; % El flujo ya existe, no se agrega
        add_to_end(Flow, Flows, NewFlows),
        chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, NewFlows,NewChatbot)
    ).


% Predicado para agregar un flujo al final de la lista de flujos
add_to_end(C, [], [C]).  % Caso base: si la lista esta vacia, agrega el flujo al final.
add_to_end(C, [H | T], [H | NewTail]) :-
    add_to_end(C,T, NewTail).

% Predicado para obtener la lista de flujos de un chatbot
chatbot_flows([_, _, _, _, Flows], Flows).

% Predicado para verificar si un ID de flujo ya existe en la lista de flujos
flow_id_existe(ID, [F | _]):- flow_id(F,I),ID=I.
flow_id_existe(ID, [_ | Rest]) :-
    flow_id_existe(ID, Rest).

chatbot_id_existe(ID,[C|_]):-
                  chatbot_id(C,I),
                  ID=I.
chatbot_id_existe(ID,[_|Rest]):-
    chatbot_id_existe(ID,Rest).


systemAddChatbot(S,C,NS):-
    system_chatbots(S,CT),
    chatbot_id(C,ID),
    system_name(S,N),
    system_codec(S,CO),
     (chatbot_id_existe(ID, CT) ->
        system(N,CO,CT,NS) ;
        add_to_end(C, CT, Newchatbots),
        system(N,CO, Newchatbots,NS)).




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
        writeln('Sesion iniciada con exito.'),
        system(N, CO, C, US, NL, NS)
    ;
    (\+ member(U, US) ->
        writeln('No existe el usuario'),
        NS = S
    ;
    (\+ es_vacia(L) ->
        writeln('Ya hay una sesion iniciada.'),
        NS = S ))).
systemLogout(S, NS) :-
    system_user(S, US),
    system_userlog(S, L),
    system_name(S, N),
    system_codec(S, CO),
    system_chatbots(S, C),
    (   \+ es_vacia(L) ->
        NL = [],
        writeln('Sesion cerrada.'),
        system(N, CO, C, US, NL, NS)
    ;
    (   es_vacia(L) ->
        writeln('No existe una sesion iniciada.'),
        NS = S
    )).


% Eliminar elementos repetidos de una lista
eliminar_repetidos([], []).
eliminar_repetidos([X|Xs], Ys) :-
    eliminar_repetidos(Xs, Ys),
    (member(X, Ys) ; (is_list(X), member(X, Ys))), !.
eliminar_repetidos([X|Xs], [X|Ys]) :-
    eliminar_repetidos(Xs, Ys).
