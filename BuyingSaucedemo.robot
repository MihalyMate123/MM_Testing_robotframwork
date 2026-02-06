*** Settings ***
Library           Selenium2Library
*** Test Cases ***
Open SauceDemo Chrome
    Open Browser    https://www.saucedemo.com/    Chrome
    Input Text     id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    //*[@id="login-button"]
    Click Button   //*[@id="add-to-cart-sauce-labs-backpack"]
    Sleep   1s
    Click Element   //*[@id="shopping_cart_container"]/a
    # Click Button   //*[@id="checkout"]
    Click Button   id=checkout
    Input Text     id=first-name    Mihaly
    Input Text     id=last-name     Mate
    Input Text     id=postal-code    12345
    Click Element   //*[@id="continue"]
    Click Element   //*[@id="finish"]
    Page Should Contain     text=Thank you for your order!
    