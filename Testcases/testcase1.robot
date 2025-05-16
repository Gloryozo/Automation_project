*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://admin-demo.nopcommerce.com/
${USERNAME}    admin@yourstore.com
${PASSWORD}    admin
${DASHBOARD}   Dashboard

*** Test Cases ***
Valid Login to nopCommerce
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Input Text    id=Email    ${USERNAME}
    Input Text    id=Password    ${PASSWORD}
    Click Button    xpath=//button[contains(@class,'login-button')]
    Wait Until Page Contains    ${DASHBOARD}    timeout=10s
    Page Should Contain    ${DASHBOARD}
    Close Browser
