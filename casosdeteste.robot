*** Settings ***
Documentation    Casos de teste para exemplo de cardápio RU
Test Setup       Abrir browser
Test Teardown    Fechar browser

Resource        resources.robot


*** Test Cases ***

Acessar cardápio do RU
    Acessar o site do RU
    Clicar no menu Cardápio
    Verificar se a página de cardápios foi disponibilzada

Verificar café da manhã do Politécnico
    Acessar o site do RU do Centro Politécnico
    Veriicar se o cardápio do café da manhã para o dia atual está disponível

Pesquisar preços
    [Tags]    preço
    Acessar o site do RU
    No menu de pesquisa escrever "preço RU" e pesquisar
    Veriicar se a página "Preços" está no resultado da busca 
    Ao clicar, os preços são exibidos