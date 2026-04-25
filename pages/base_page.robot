*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../variables/variables_globales.robot
*** Variables ***
${BROWSER}      chrome
*** Keywords ***
Se connecter au site 
    IF    '${BROWSER}' == 'chrome'
        ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()
        Call Method    ${options}    add_argument    --headless
        Call Method    ${options}    add_argument    --no-sandbox
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
        Call Method    ${options}    add_argument    --window-size=1920,1080
        Open Browser    ${BASE_URL}    chrome    options=${options}

    ELSE IF    '${BROWSER}' == 'firefox'
        ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.FirefoxOptions()
        Call Method    ${options}    add_argument    --headless
        Open Browser    ${BASE_URL}    firefox    options=${options}

    ELSE
        Fail    Navigateur non supporté : ${BROWSER}
    END

    Maximize Browser Window
    Set Selenium Timeout    ${SELENIUM_TIMEOUT}