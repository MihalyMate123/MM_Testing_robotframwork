*** Settings ***
Library    Selenium2Library
Library    Collections


*** Test Cases ***
Login With Valid Credentials
    Open Browser    https://parking-garage-app.netlify.app/    firefox    
    Click Element    //*[@id="login-link"]
    Sleep     2s
    Input Text     id=email    mihaly.mate@diak.szbi-pg.hu
    Input Password    id=password    asdasd123
    Click Button    //*[@id="login-button"]
    Sleep     2s
    Page Should Contain Element    //*[@id="cars-link"]
    Close Browser
Login With Wrong Password
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element    //*[@id="login-link"]
    Sleep     2s
    Input Text     id=email    mihaly.mate@diak.szbi-pg.hu
    Input Password    id=password    hibasjelszo
    Click Button    //*[@id="login-button"]
    Sleep     2s
    Page Should Contain      text=Invalid email or password.
    Close Browser
Login With Unexisting Email
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element    //*[@id="login-link"]
    Sleep     2s
    Input Text     id=email    nonexistent.email@diak.szbi-pg.hu
    Input Password    id=password    asdasd123
    Click Button    //*[@id="login-button"]
    Sleep     2s
    Page Should Contain      text=Invalid email or password.
    Close Browser
Login With Empty Data
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element    //*[@id="login-link"]
    Sleep     2s
    Click Button    //*[@id="login-button"]
    Sleep     2s
    ${msg}=    Execute JavaScript    const el=document.querySelector(':invalid'); return el ? el.validationMessage : '';
    Sleep     2s
    Should Not Be Empty    ${msg}
    Close Browser
Kijelentkezes utan vedett oldalak eleresenek tiltasa
    Open Browser    https://parking-garage-app.netlify.app/    firefox    
    Click Element    //*[@id="login-link"]
    Sleep     2s
    Input Text     id=email    mihaly.mate@diak.szbi-pg.hu
    Input Password     id=password    asdasd123
    Click Button    //*[@id="login-button"]
    Sleep     2s
    Page Should Contain Element    //*[@id="cars-link"]
    Sleep     2s
    Click Element    //*[@class="nav-button logout-button svelte-d9gtjo"]
    Sleep     2s
    Go To     https://parking-garage-app.netlify.app/cars
    Sleep     2s
    Page Should Contain     text=Parkolóház
    Close All Browsers