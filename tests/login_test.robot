*** Settings ***
Resource    ../pages/login_page.robot

*** Variables ***
${Valid_Username}      standard_user
${Valid_Password}      secret_sauce
${Invalid_Username}    wrong
${Invalid_Password}    wrong

*** Test Cases ***
Login valide
    [Setup]    Se connecter au site
    [Teardown]    Close All Browsers

    Saisir username    ${Valid_Username}
    Saisir mot de passe    ${Valid_Password}
    Cliquer sur le bouton Login
    Verifier affichage page Produits
    Capture Page Screenshot

Login invalide
    [Setup]    Se connecter au site
    [Teardown]    Close All Browsers

    Saisir username    ${Invalid_Username}
    Saisir mot de passe    ${Invalid_Password}
    Cliquer sur le bouton Login
    Page Should Contain Element    xpath=//h3[contains(text(),'Epic sadface')]
    Capture Page Screenshot
