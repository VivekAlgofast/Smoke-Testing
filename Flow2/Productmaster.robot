*** Settings ***
Library           SeleniumLibrary
Library    XML
Library           OperatingSystem
Library           pymysql
Library           DatabaseLibrary
Resource          ../Mainsuite/Variables.robot
*** Variables ***
${Product_master_value}    HR Department
${DB_HOST}        192.168.1.200

${DB_PORT}        3306

${DB_NAME}        userDb

${DB_USER}        algofast

${DB_PASSWORD}    algofast@123

${Cdb_name}    crmapp412
   
*** Keywords ***
Product master Form Keyword
    Sleep  3s
    Wait Until Element Is Enabled    xpath=//a[.//span[text()='Administration']]    20s
    # Click Element    xpath=//*[name()='path' and contains(@d,'M3 18h18v-')]
    Click Element    xpath=//a[.//span[text()='Administration']]
    Wait Until Element Is Visible    xpath=//span[normalize-space()='Master Data']
    Mouse over    xpath=//span[normalize-space()='Master Data']
    Mouse over    xpath=//span[normalize-space()='Product Masters']
    Click Element    xpath=//span[normalize-space()='Products']
    Sleep   3s
    Click Button    xpath=//button[normalize-space()='Add New']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id='name']  ${Product_master_value}
    sleep   2s
    click Element    xpath= //*[@id="unit"]
    Input Text    xpath= //*[@id="unit"]   ${Product_unit_master_value}
    Sleep    2s
    Press Keys    xpath= //*[@id="unit"]     ENTER
    Sleep    2s
    Input Text    xpath=//*[@id="price"]  12
    Sleep    2s 
    # click Element    xpath=//*[@id="category"]
    # Input Text    xpath= //*[@id="category"]   Product
    # # Sleep    2s
    # Press Keys    xpath= //*[@id="category"]     ENTER
    Click Element    xpath=//*[@id="category"]
    Input Text    xpath=//*[@id="category"]    Product
    Sleep    2s
    Press Keys    xpath=//*[@id="category"]    ARROW_DOWN
    Press Keys    xpath=//*[@id="category"]    ENTER
    Sleep  2s
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep    3s
     ${name_entered}    Get Value    css=#name
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${Cdb_name}  # This is the company-specific database
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    ${sql_query}=    Set Variable    SELECT name FROM product_master WHERE name='${name_entered}' LIMIT 1;
    Log To Console    ${sql_query}
    ${result} =    Execute Sql String    ${sql_query}
    Run Keyword If    '${result}' == '[]'    Fail    "Value '${name_entered}' was not found in the database"
    Log To Console    "Value '${name_entered}' found in the database successfully"
    Disconnect From Database

Edit and Delete Product master
    Click Element    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-bte7tm']//*[name()='svg']
    Sleep  3s
    Click Element    xpath=//div[@role='gridcell']//button[@type='button']//*[name()='svg']
    Click Element    xpath=//p[normalize-space()='Edit']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id='name']   ${Product_master_value}
    sleep   2s
    click Element    xpath= //*[@id="unit"]
    Press Keys    xpath= //*[@id="unit"]     ENTER
    Sleep    2s
    Input text   xpath= //*[@id="price"]     12
    Sleep   2s
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep    3s
    Click Element    xpath=//div[@role='gridcell']//button[@type='button']//*[name()='svg']
    Click Element    xpath=//p[normalize-space()='Delete']
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Delete']
    Click Button    xpath=//button[normalize-space()='Delete']
    
Adding Product master field again
    Sleep    3s
    Click Element    xpath=//button[@aria-label='Add New']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id="name"]    ${Product_master_value}
    sleep   2s
    click Element    xpath= //*[@id="unit"]
    Input Text    xpath= //*[@id="unit"]   ${Product_unit_master_value}
    Sleep    2s
    Press Keys    xpath= //*[@id="unit"]     ENTER
    Sleep    2s
    Input Text    xpath=//*[@id="price"]  12
    Sleep    2s 
    Click Element    xpath=//*[@id="category"]
    Input Text    xpath=//*[@id="category"]    Product
    Sleep    2s
    Press Keys    xpath=//*[@id="category"]    ARROW_DOWN
    Press Keys    xpath=//*[@id="category"]    ENTER
    Sleep    2s
    Click Button    xpath=//button[normalize-space()='Submit']
    Click Element    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-bte7tm']//*[name()='svg']
    