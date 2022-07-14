*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}           chrome 
${URL}               http://www.amazon.com.br
${MENU_PRINCIPAL}    //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${HEADER_LIVROS}     //h1[contains(.,'Loja de Livros')]
${CAMPO_PESQUISA}    twotabsearchtextbox
${BOTAO_PESQUISA}    nav-search-submit-button
${RESULTADO}         search

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_PRINCIPAL}

Entrar no menu "Livros"
    Click Element    locator=${MENU_PRINCIPAL}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains         text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_LIVROS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=${CAMPO_PESQUISA}    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=${BOTAO_PESQUISA}

Verificar o resultado da pesquisa se esta listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[3]