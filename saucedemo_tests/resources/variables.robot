*** Variables ***
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${BROWSER}        chrome
${LOGIN_SUCCESS}  xpath=//span[text()='Products']
${INVALID_USERNAME}     invalid_user
${INVALID_PASSWORD}     wrong_password
${ERROR_LOCATOR}        css:[data-test="error"]
${CHROME_OPTIONS}    --disable-popup-blocking --disable-password-manager-reauthentication --disable-save-password-bubble --disable-autofill-keyboard-accessory-view --disable-autofill-server-suggestions --disable-credential-manager-api

