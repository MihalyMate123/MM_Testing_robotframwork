*** Settings ***
Library           Selenium2Library
*** Test Cases ***
Open SauceDemo Firefox
    Open Browser    https://www.saucedemo.com/    Firefox
    Sleep    3s    
    Close Browser

Open SauceDemo Chrome
    Open Browser    https://www.saucedemo.com/    Chrome
    Sleep    3s
    Close Browser