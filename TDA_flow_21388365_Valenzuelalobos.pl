:-consult('TDA_option_21388365_Valenzuelalobos.pl').
:-consult('TDA_extras_21388365_Valenzuelalobos.pl').
%tda
% tipo:contructor
%  Predicado:flow(ID,Name,Options,flujo)
% Dominio:ID(number),Name(strin),Options (lista de opciones),flujo(lista).
% Meta:predicado constructor de un flujo de un chatbot.
%
%
% tipo:selector
%  Predicado:flow_id(flow,Id)
% Dominio:flow(lista ), Id(number)
% Meta:obtener el id de un flujo

%
% tipo:modificador
% predicado:flowaddoption(opcion,flujo,newfujo)
% Dominio:opcion(lista), flujo(lista),newflujo(lista)
% Meta:modificador para añadir opciones a un flujo, siempre y cuando no se  repita la id.

%  Predicado:option_code_exists
% Dominio:codigo(number), options(lista de opciones)
% meta:verificar si un el codigo proporcionado ya existe dentro de la
% lista de opciones






%clausulas
flow(I,N,O,[I,N,O]).

flow_id([I,_,_],I).
flow_options([_,_,O],O).
flow_name([_,N,_],N).


flowAddOption(Flujo,Option, NewList) :-
    flow_options(Flujo,Options),
    flow_id(Flujo,Id),
    flow_name(Flujo,Name),
    option_code(Option, Code),                % Obtiene el codigo de la nueva opcion
    \+ option_code_exists(Code, Options),     % Verifica si el codigo de la nueva opcion no existe en la lista actual
    NewOptions = [Option | Options],         % Agrega la nueva opcion al principio de la lista de opciones
    flow(Id, Name, NewOptions,NewList).         % Construye la nueva lista con la opcopn agregada




option_code_exists(Code, Options) :-
    member([ExistingCode, _, _, _, _], Options),  % Extrae el codigo de cada opcion en Options
    ExistingCode = Code.
