*** Settings ***
Documentation    Casos de teste em formato gherkin para exemplo de cardápio RU
Test Setup       Abrir browser
Test Teardown    Fechar browser

Resource        resources.robot

*** Test Cases ***

Acessar cardápio do RU
    [Tags]    acesso
    Given A página do RU é acessada
    When Clicar no menu de Cardápio
    Then A página de cardápios é exibida
