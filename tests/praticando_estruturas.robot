*** Settings ***
Documentation   Praticando estruturas com for e if

*** Variables ***

@{Lista_Numeros}   1    2    3    4    5    6    7    8    9    10

*** Test Case ***
Imprimindo alguns números
    Keyword responsável pela impressão de números

*** Keywords ***
Keyword responsável pela impressão de números
    Log To Console    ${\n}
    FOR  ${Número}   IN  @{Lista_Numeros}
        IF    ${Número} == 5 or ${Número} == 10
            Log To Console    Eu sou o número ${Número}!
        ELSE
            Log To Console    Eu não sou o número 5 e nem o 10!
        END
    END
