consult('TDA_option_213883658.pl').
%tda
% tipo:contructor
% Predicado:flow
% Dominio:ID(number),Name(strin),Options (lista de opciones).
% Meta:predicado constructor de un flujo de un chatbot.
%
%
% tipo:selector
% Predicado:flow_id(flow, Id)
% Dominio:flow(lista),Id(number)
% Meta:obtener el id de un flujo

%
% tipo:modificador
% Predicado:flowaddoption(option,flujo)
% Dominio:opcion(lista), flujo(lista).
% Meta:modificador para añadir opciones a un flujo, siempre y cuando no
% se  repirta la id.
%
%tipo:pertenencia
% Predicado:option_code_exists(code,options)
% Dominio:codigo(number), options(lista de opciones)
% meta:verificar si un el codigo proporcionado ya existe dentro de una
% lista de opciones






%clausulas
flow(I,N,O,[I,N,O]).
flow_id([I,_,_],I).


flowaddoption(Option, [Id, Name, Options], NewList) :-
    option_code(Option, Code),                % Obtiene el codigo de la nueva opcion
    \+ option_code_exists(Code, Options),     % Verifica si el codigo de la nueva opcion no existe en la lista actual
    NewOptions = [Option | Options],         % Agrega la nueva opcion al principio de la lista de opciones
    flow(Id, Name, NewOptions,NewList).         % Construye la nueva lista con la opcopn agregada
flowaddoption(_, OriginalList, OriginalList). % en caso de no poder agregar la nueva opcion ya que ya existe su codigo retorna la lista original



option_code_exists(Code, Options) :-
    member([ExistingCode, _, _, _, _], Options),  % Extrae el codigo de cada opcion en Options
    ExistingCode = Code.
