*** Settings ***
Library           Selenium2Library
*** Test Cases ***
Open SauceDemo Chrome
    Open Browser    https://www.saucedemo.com/    Chrome
    Input Text     id=user-name    standard_user
    Input Password    id=password    secret_sauce
    #Click Button    id=login-button
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Sleep    3s
*** Test Cases ***
Right username wrong password
    Open Browser    https://www.saucedemo.com/    Chrome
    Input Text     id=user-name    standard_user
    Input Text     id=password    adsadadassad
    Click Button    //*[@id="login-button"]
    Page Should Contain     text=Epic sadface: Username and password do not match any user in this service
    Sleep    4s
Wrong username right password
    Input Text     id=user-name    asdassadasdsa
    Input Text     id=password    secret_sauce
    Click Button    //*[@id="login-button"]
    Page Should Contain     text=Epic sadface: Username and password do not match any user in this service
    Sleep    4s
No username
    Open Browser    https://www.saucedemo.com/    Chrome
    Input Text     id=password    secret_sauce
    Click Button    //*[@id="login-button"]
    Page Should Contain     text=Epic sadface: Username is required
    Sleep    4s
No password
    Open Browser    https://www.saucedemo.com/    Chrome
    Input Text     id=user-name     standard_user
    Click Button    //*[@id="login-button"]
    Page Should Contain     text=Epic sadface: Password is required
    Sleep    4s
    