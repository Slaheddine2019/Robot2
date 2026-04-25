*** Settings ***
Library    SeleniumLibrary
Resource    base_page.robot

*** Variables ***
${Username_Field}     id=user-name
${Password_Field}     id=password
${Btn_Login}          id=login-button
${Title_Produits}     xpath=//span[@class='title']

*** Keywords ***
Saisir username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${Username_Field}    10s
    Input Text    ${Username_Field}    ${username}

Saisir mot de passe
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${Password_Field}    10s
    Input Text    ${Password_Field}    ${password}

Cliquer sur le bouton Login
    Click Button    ${Btn_Login}

Verifier affichage page Produits
    Wait Until Element Is Visible    ${Title_Produits}    10s
    Element Should Contain    ${Title_Produits}    Products
