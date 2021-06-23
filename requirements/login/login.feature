Feature: Login 
Como um cliente 
Quero poder acessar a conta e me manter logado 
Para que possa ver e responder enquete de forma rápida 

Cenário: Credenciais Válidas 
Dado que o cliente informou Credenciais válidas 
Quando solicitar para fazer o login
Então o sistema deve enviar o usuário para a tela de pesquisa 
E manter o usuário conectado 

Cenário: Credenciais Inválidas 
Dado que o cliente informou credenciais inválidas 
Quando solicitar para fazer o login 
Então o sistema deve retornar uma mensagem de erro