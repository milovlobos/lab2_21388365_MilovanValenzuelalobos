consult('TDA_option_213883658.pl').

%tda option
% predicados
% tipo:contructor
% nombre:option(Code,message , ChatbotCodeLink ,InitialFlowCodeLink ,
% Keyword , Option)
% Dominio:code(number),ChatbotCodeLink,(number),InitialFlowCodeLink(number),
% Kerword(lista de string). Recorrido:option lista(code,message ,
% ChatbotCodeLink ,InitialFlowCodeLink , Keyword , Option)
% Meta:constructor de una opci�n para flujo de un chatbot.
%
%
% tipo:selector
% nombre:option_code(option,code)
% Dominio:option(opcion)
%Recorrido:code(number)
% Meta:obtener el codigo de una opcion.






%clausula
option(C, M, CH, I, K, [C, M, CH, I, K]).

option_code([Code, _, _, _, _], Code).
