*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://pra.ufpr.br/ru/ru-central/
${TITULO}              Restaurante Universitário
${MENU}                (//a[@title='Cardápio'][contains(.,'Cardápio')])[2]
${TIT_CARDAPIO}        //h2[contains(.,'Cardápios')]
${SUBMIT_BUSCA}        //input[contains(@type,'submit')]
${TITULO_BUSCA}        //h3[contains(.,'Resultados da pesquisa')]
${LINK_PRECOS}        (//a[@href='https://pra.ufpr.br/ru/precos/'][contains(.,'Preços')])[3]
${TIT_VALORES}             //h2[contains(.,'Valores cobrados por refeição nos RUs/UFPR')]

*** Keywords ***
Abrir browser
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar browser
    Capture Page Screenshot
    Close Browser

Acessar o site do RU
    Go To    ${URL}   
    Title Should Be    ${TITULO}  

Clicar no menu Cardápio
    Click Element    ${MENU} 

Verificar se a página de cardápios foi disponibilzada
    Wait Until Element Is Visible    ${TIT_CARDAPIO}  

Acessar o site do RU do Centro Politécnico
    Go To    url=https://pra.ufpr.br/ru/ru-centro-politecnico/
    Wait Until Element Is Visible    locator=//h2[contains(.,'Cardápio RU Centro Politécnico')]
    
Veriicar se o cardápio do café da manhã para o dia atual está disponível
    Wait Until Element Is Visible    locator=(//strong[contains(.,'CAFÉ DA MANHÃ')])[1]
    ${DIA}    Get Time     format=day=19
    ${MES}    Get Time     format=month
    ${ANO}    Get Time     format=year
    Log    message=A data atual é ${DIA}/${MES}/${ANO}
    Wait Until Page Contains      ${DIA}/${MES}/${ANO}

No menu de pesquisa escrever "${TERMO_BUSCA}" e pesquisar
    Input Text    //input[@id='s']    ${TERMO_BUSCA}
    Click Button    ${SUBMIT_BUSCA}
    Wait Until Element Is Visible    ${TITULO_BUSCA}

Veriicar se a página "Preços" está no resultado da busca 
    Element Should Be Visible    ${LINK_PRECOS}

Ao clicar, os preços são exibidos
    Click Element    ${LINK_PRECOS}
    Wait Until Element Is Visible    ${TIT_VALORES}


### GHERKIN 
A página do RU é acessada
    Acessar o site do RU

Clicar no menu de Cardápio
    Clicar no menu Cardápio

A página de cardápios é exibida
    Verificar se a página de cardápios foi disponibilzada