%predicado
%option(code,message , ChatbotCodeLink ,InitialFlowCodeLink , Keyword , Option)
%flow(Id, Name, option ,flow)
%chatbot(chatbotID, name , welcomeMessage ,startFlowId ,flows,chabot)
% system(name,InitialChatbotCodeLink ,chatbots,system)
%
%comillas'hola' clausulas contructores
%
option(C, M, CH, I, K, [C, M, CH, I, K]).

flow(I,N,O,[I,N,O]).

chatbot(I,N,WM,SF,F,[I,N,WM,SF,F]).

system(N,IC,C,[N,IC,C]).
