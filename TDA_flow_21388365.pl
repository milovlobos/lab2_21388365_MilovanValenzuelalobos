consult('TDA_option_213883658.pl').
%tda
% tipo:contructor
% nombre:flow
% Dominio:ID(number),Name(strin),Options (lista de opciones).
%Recorrido:flow([id,name,option]).
% Meta:predicado constructor de un flujo de un chatbot.
%
%
% tipo:selector
% nombre:flow_id
% Dominio:flow
%Recorrido:Id(number)
% Meta:obtener el id de un flujo

%
% tipo:modificador
% nombre:flowaddoption
% Dominio:opcion, flujo
%Recorrido:nuevoflujo
% Meta:modificador para a�adir opciones a un flujo, siempre y cuando no
% se  repirta la id.
%
% nombre:option_code_exists
% Dominio:codigo, options(lista de opciones)
% recorrido:bool
% meta:verificar si un el codigo proporcionado ya existe dentro de la
% lista de opciones






%clausulas
flow(I,N,O,[I,N,O]).
flow_id([I,_,_],I).


flowaddoption(Option, [Id, Name, Options], NewList) :-
    option_code(Option, Code),                % Obtiene el codigo de la nueva opcion
    \+ option_code_exists(Code, Options),     % Verifica si el codigo de la nueva opcion no existe en la lista actual
    NewOptions = [Option | Options],         % Agrega la nueva opcion al principio de la lista de opciones
    flow(Id, Name, NewOptions,NewList).         % Construye la nueva lista con la opcopn agregada

option_code_exists(Code, Options) :-
    member([ExistingCode, _, _, _, _], Options),  % Extrae el codigo de cada opcion en Options
    ExistingCode = Code.
