*** Settings ***
Documentation   Criando um e-mail utilizando argumentos
Library         String

*** Variable ***

*** Test Cases ***
Montando um e-mail    
    Keyword que realiza a montagem do e-mail

*** Keywords ***
Keyword que realiza a montagem do e-mail
    ${Email_completo}    Sub_Keyword que realiza a montagem do e-mail    Monique   Oliveira
    Log    ${Email_completo}

Sub_Keyword que realiza a montagem do e-mail
    [Arguments]    ${Pessoa.Nome}    ${Pessoa.Sobrenome}
    ${Palavra_aleatoria}     Generate Random String
    [Return]    ${Pessoa.Nome}${Pessoa.Sobrenome}${Palavra_aleatoria}@testerobot.com
    
    