*** Settings ***
Library    Selenium2Library
Library    Collections
Library    String
Resource   Login_Keyword.robot

*** Test Cases ***
   # A-Z sorting
Sorting Z-A
    Login With Valid Credentials
    Click Element     class:product_sort_container
    Click ELement     //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${products} =     Get All Product Names
    Verify Sorting Z-A   ${products}
Sorting A-Z
    Click Element     class:product_sort_container
    Click ELement     //*[@id="header_container"]/div[2]/div/span/select/option[1]
    ${products} =     Get All Product Names
    Verify Sorting A-Z   ${products}
Sorting Price Low-High
    Click Element     class:product_sort_container
    Click ELement     //*[@id="header_container"]/div[2]/div/span/select/option[3]
    ${prices} =    Get All Prices
    Verify Sorting Low-High   ${prices}    
Sorting Price High-Low
    Click Element     class:product_sort_container
    Click ELement     //*[@id="header_container"]/div[2]/div/span/select/option[4]
    ${prices} =    Get All Prices
    Verify Sorting High-Low   ${prices}

*** Keywords ***
Get All Product Names
    ${products} =     Create List
    @{product_elements} =      Get WebElements    class:inventory_item_name
    FOR    ${element}    IN    @{product_elements}
        ${text} =    Get Text    ${element}
        Append To List    ${products}    ${text}
    END
    RETURN    @{products}
Verify Sorting Z-A
    [Arguments]    ${products}
    ${length} =    Get Length    ${products}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current} =    Get From List    ${products}    ${index}
        ${next} =       Get From List    ${products}    ${index + 1}
        Should Be True    '${current}' >= '${next}'    Sorting is not Z-A at index ${index}
    END
Verify Sorting A-Z
    [Arguments]    ${products}
    ${length} =    Get Length    ${products}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current} =    Get From List    ${products}    ${index}
        ${next} =       Get From List    ${products}    ${index + 1}
        Should Be True    '${current}' <= '${next}'    Sorting is not A-Z at index ${index}
    END
Get All Prices
    ${prices} =     Create List
    @{price_elements} =      Get WebElements    class:inventory_item_price
    FOR    ${element}    IN    @{price_elements}
        ${text} =    Get Text    ${element}
        ${no_dollar} =    Replace String    ${text}    $    ${EMPTY}
        ${clean} =    Replace String    ${no_dollar}    ,    ${EMPTY}
        ${num} =    Convert To Number    ${clean}
        Append To List    ${prices}    ${num}
    END
    RETURN    @{prices}
Verify Sorting Low-High
    [Arguments]    ${prices}
    ${length} =    Get Length    ${prices}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current} =    Get From List    ${prices}    ${index}
        ${next} =       Get From List    ${prices}    ${index + 1}
        Should Be True    ${current} <= ${next}    Sorting is not Low-High at index ${index}
    END
Verify Sorting High-Low
    [Arguments]    ${prices}
    ${length} =    Get Length    ${prices}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current} =    Get From List    ${prices}    ${index}
        ${next} =       Get From List    ${prices}    ${index + 1}
        Should Be True    ${current} >= ${next}    Sorting is not High-Low at index ${index}
    END