*** Settings ***
Library    SeleniumLibrary
Resource  ../resources/variables.robot

*** Test Cases ***
Add Product To Cart
    [Documentation]    Verify user can add a product to the cart
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    ${CHROME_OPTIONS}
    Create WebDriver    Chrome    options=${options}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password     ${PASSWORD}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=add-to-cart-sauce-labs-backpack    timeout=5s
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Element   id=shopping_cart_container
    Wait Until Page Contains    Your Cart    timeout=10s
    Page Should Contain Element    xpath=//div[text()='Sauce Labs Backpack']
    Close Browser

Remove Product From Cart
    [Documentation]    Verify user can remove a product from the cart
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password     ${PASSWORD}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=add-to-cart-sauce-labs-backpack    timeout=5s
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Element   id=shopping_cart_container
    Wait Until Page Contains    Your Cart    timeout=5s
    Page Should Contain Element    xpath=//div[text()='Sauce Labs Backpack']
    Click Button    id=remove-sauce-labs-backpack
    Wait Until Page Does Not Contain Element    xpath=//div[text()='Sauce Labs Backpack']    timeout=5s
    Close Browser

 Complete Checkout Process
    [Documentation]    Verify user can complete checkout process successfully
     ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    ${CHROME_OPTIONS}
    Create WebDriver    Chrome    options=${options}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password     ${PASSWORD}
    Click Button    id=login-button
    Wait Until Page Contains Element    id=add-to-cart-sauce-labs-backpack    timeout=5s
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Element   id=shopping_cart_container
    Wait Until Page Contains Element    id=checkout    timeout=5s
    Click Button    id=checkout
    Wait Until Page Contains Element    id=first-name    timeout=5s
    Input Text    id=first-name    John
    Input Text    id=last-name     Doe
    Input Text    id=postal-code   12345
    Click Button    id=continue
    Wait Until Page Contains Element    id=finish    timeout=5s
    Click Button    id=finish
    Wait Until Page Contains    THANK YOU FOR YOUR ORDER    timeout=10s
    Page Should Contain    THANK YOU FOR YOUR ORDER
    Capture Page Screenshot
    Close Browser
