*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   ../resources/variables.robot

*** Test Cases ***
Logout From SauceDemo Without Popups
    [Documentation]    Verify user can logout successfully with popups disabled
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    ${CHROME_OPTIONS}
    Create WebDriver    Chrome    options=${options}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password     ${PASSWORD}
    Click Button    id=login-button
    Wait Until Element Is Visible    id=react-burger-menu-btn    timeout=5s
    Click Element    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link    timeout=5s
    Click Element    id=logout_sidebar_link
    Wait Until Element Is Visible    id=login-button    timeout=10s
    Page Should Contain Element      id=login-button
    Capture Page Screenshot
    Close Browser
