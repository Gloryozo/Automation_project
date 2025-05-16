*** Settings ***
Library    SeleniumLibrary
Resource  ../resources/variables.robot

*** Test Cases ***
Valid Login To SauceDemo
    [Documentation]  Verify user can log in with valid credentials.
    Open Browser    ${URL}     ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password     ${PASSWORD}
    Click Button  id=login-button
    Wait Until Element Is Visible  ${LOGIN_SUCCESS}  timeout=5s
    Page Should Contain Element    ${LOGIN_SUCCESS}
    Close Browser

Invalid Login To SauceDemo
    [Documentation]    Verify user cannot log in with invalid credentials
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${INVALID_USERNAME}
    Input Text    id=password     ${INVALID_PASSWORD}
    Click Button    id=login-button
    Wait Until Element Is Visible    css:[data-test="error"]    timeout=5s
    Page Should Contain Element      css:[data-test="error"]
    Capture Page Screenshot
    Close Browser
