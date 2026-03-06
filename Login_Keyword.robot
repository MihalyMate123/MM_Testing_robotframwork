*** Settings ***
Library    Selenium2Library
Library    Collections

*** Keywords ***
Login With Valid Credentials
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text     id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a

