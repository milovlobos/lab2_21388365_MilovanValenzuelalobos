:-consult('TDA_extras_21388365_Valenzuelalobos.pl').

%tda option
% predicados
% tipo:contructor
% predicado:option(Code,message , ChatbotCodeLink ,InitialFlowCodeLink , Keyword , Option)
% Dominio:code(number),ChatbotCodeLink,(number),InitialFlowCodeLink(number),Kerword(lista de string),option(lista).
% Meta:constructor de una opcion para flujo de un chatbot.
%
% tipo:selector
% predicado:option_code(option,code)
% Dominio:option(opcion),code(number)
% Meta:obtener el codigo de una opcion.






%clausula
option(C, M, CH, I, K, [C, M, CH, I, K]).

option_code([Code, _, _, _, _], Code).
