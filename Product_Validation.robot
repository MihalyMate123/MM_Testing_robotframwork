*** Settings ***
Library    Selenium2Library
Library    Collections
Library    String
Resource   Login_Keyword.robot

*** Test Cases ***
Product Page from Product Name
    Login With Valid Credentials
    ${product_name} =    Get Text    class:inventory_item_name
    ${product_img} =     Get WebElement    class:inventory_item_img
    ${product_price} =   Get Text    class:inventory_item_price
    ${product_desc} =    Get Text    class:inventory_item_desc
    Click Element     class:inventory_item_name
    Page Should Contain Element   class:inventory_details_name    == ${product_name}
    Page Should Contain Element   class:inventory_details_img     == ${product_img}
    Page Should Contain Element   class:inventory_details_price   == ${product_price}
    Page Should Contain Element   class:inventory_details_desc    == ${product_desc}
    Click Button    //*[@id="back-to-products"]
    Sleep    3s
Product Page from Product Image
    ${product_name} =    Get Text    class:inventory_item_name
    ${product_img} =     Get WebElement    class:inventory_item_img
    ${product_price} =   Get Text    class:inventory_item_price
    ${product_desc} =    Get Text    class:inventory_item_desc
    Click Element     class:inventory_item_img
    Page Should Contain Element   class:inventory_details_name    == ${product_name}
    Page Should Contain Element   class:inventory_details_img     == ${product_img}
    Page Should Contain Element   class:inventory_details_price   == ${product_price}
    Page Should Contain Element   class:inventory_details_desc    == ${product_desc}
    Click Button    //*[@id="back-to-products"]
    Sleep    3s
Checkout Validation
    Click Element     class:inventory_item_name
    Click Button     //*[@id="add-to-cart"]
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Button     //*[@id="checkout"]
    Click Button     //*[@id="continue"]
    Page Should Contain Element     //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Sleep     2s
Checkout Validation with Long Input    
    ${long_name}=    Evaluate    "A" * 100    
    Input Text       //*[@id="first-name"]    ${long_name}
    Input Text       //*[@id="last-name"]     ${long_name}
    Input Text       //*[@id="postal-code"]   ${long_name}
    Click Button     //*[@id="continue"]


    
*** Keywords ***
Get All Product Names
    ${products} =     Create List
    @{product_elements} =      Get WebElements    class:inventory_item_name
    FOR    ${element}    IN    @{product_elements}
        ${text} =    Get Text    ${element}
        Append To List    ${products}    ${text}
    END
    RETURN    @{products}