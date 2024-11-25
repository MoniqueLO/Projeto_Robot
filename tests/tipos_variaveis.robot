*** Settings ***
Documentation   Exemplo de utilizaçao de tipos de variáveis do Robot

*** Variable ***
@{MESES_ANO}    
...             Janeiro    
...             Fevereiro    
...             Março    
...             Abril    
...             Maio    
...             Junho    
...             Julho    
...             Agosto    
...             Setembro    
...             Outubro    
...             Novembro    
...             Dezembro

&{QUANTIDADE_DIAS}    
...    Janeiro=31    
...    Fevereiro=28    
...    Março=31    
...    Abril=30    
...    Maio=31    
...    Junho=31    
...    Julho=30    
...    Agosto=31
...    Setembro=30
...    Outubro=31
...    Novembro=30
...    Dezembro=30

*** Test Cases ***
Caso de imprimir meses do ano
    Keyword que realizada impressão dos meses do ano

Caso de imprimir dias de cada mês
    Keyword que realiza impressão da quantidade de dias de cada mês
    
*** Keywords ***
Keyword que realizada impressão dos meses do ano
    Log To Console  ${MESES_ANO[0]}     
    Log To Console  ${MESES_ANO[1]}    
    Log To Console  ${MESES_ANO[3]}    
    Log To Console  ${MESES_ANO[4]}    
    Log To Console  ${MESES_ANO[5]}    
    Log To Console  ${MESES_ANO[6]}        
    Log To Console  ${MESES_ANO[7]}
    Log To Console  ${MESES_ANO[8]}
    Log To Console  ${MESES_ANO[9]}
    Log To Console  ${MESES_ANO[10]}
    Log To Console  ${MESES_ANO[11]}

Keyword que realiza impressão da quantidade de dias de cada mês
    Log To Console  Janeiro: ${QUANTIDADE_DIAS.Janeiro}  
    Log To Console  Fevereiro: ${QUANTIDADE_DIAS.Fevereiro}
    Log To Console  Março: ${QUANTIDADE_DIAS.Março}
    Log To Console  Abril: ${QUANTIDADE_DIAS.Abril}
    Log To Console  Maio: ${QUANTIDADE_DIAS.Maio}
    Log To Console  Junho: ${QUANTIDADE_DIAS.Junho}
    Log To Console  Julho: ${QUANTIDADE_DIAS.Julho}
    Log To Console  Agosto: ${QUANTIDADE_DIAS.Agosto}
    Log To Console  Setembro: ${QUANTIDADE_DIAS.Setembro}
    Log To Console  Outubro: ${QUANTIDADE_DIAS.Outubro}
    Log To Console  Novembro: ${QUANTIDADE_DIAS.Novembro}
    Log To Console  Dezembro: ${QUANTIDADE_DIAS.Dezembro}


