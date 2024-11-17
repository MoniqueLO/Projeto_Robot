*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                         http://www.amazon.com.br
${MENU_ELETRONICOS}            //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}          //h2[contains(.,'Eletrônicos e Tecnologia')]
${CAMPO_PESQUISA}              twotabsearchtextbox  
${BOTAO_PESQUISA}              nav-search-submit-button
${BOTAO_PARA_CARRINHO}         //div[@class=' nav-progressive-attribute']


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Finalizar teste
    Capture Page Screenshot

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Sleep   15s
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOMECATEGORIA}"
    Element Should Be Visible    locator=//span[@class='nav-a-content'][contains(.,'${NOMECATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=${CAMPO_PESQUISA}    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=${BOTAO_PESQUISA}

Verificar resultado da pesquisa se está listando o produto "${PRODUTO}"
    Element Should Be Visible    locator=(//span[contains(.,'${PRODUTO}')])[8]

Clicar para acessar o item "${PRODUTO}"   
    Click Element    locator=//img[@alt='${PRODUTO}']

Clicar para incluir o item no carrinho    
    Click Element    id=add-to-cart-button

Verificar se o item "${PRODUTO}" foi incluido no carrinho    
    Click Element    id=nav-cart-count
    Click Element    locator=${BOTAO_PARA_CARRINHO}
    Element Should Be Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]

Remove o item do carrinho 
    Click Button    locator=//input[@value='Excluir']

Verificar que o carrinho está vazio
    Wait Until Page Contains    text=Seu carrinho de compras da Amazon está vazio.

#GHERKIN
Dado que o usuário está na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessa o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Clicar no botão de pesquisa

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Clicar no botão de pesquisa
    Verificar resultado da pesquisa se está listando o produto "Xbox Series S"

E o usuário inclui o produto "Xbox Series S" no carrinho
    Clicar para acessar o item "Xbox Series S"
    Clicar para incluir o item no carrinho

Então verifica que o produto "Xbox Series S" foi adicionado com sucesso  
    Verificar se o item "Xbox Series S" foi incluido no carrinho  

E o usuário remove o produto "Xbox Series S" do carrinho
    Verificar se o item "Xbox Series S" foi incluido no carrinho 
    Remove o item do carrinho 

Então verifica que o carrinho está vazio
    Verificar que o carrinho está vazio
