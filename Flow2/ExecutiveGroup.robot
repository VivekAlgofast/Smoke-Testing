*** Settings ***
Library           SeleniumLibrary
Library    XML
Library           OperatingSystem
Library           pymysql
Library           DatabaseLibrary
Resource       ../Mainsuite/Variables.robot
*** Keywords ***
ExecutiveGroup master Form Keyword
    Sleep   3s
    Wait Until Element Is Enabled    xpath=//a[.//span[text()='Administration']]    20s
    Click Element    xpath=//a[.//span[text()='Administration']]
    Wait Until Element Is Visible    xpath=//span[normalize-space()='Master Data']
    Mouse Over    xpath=//span[normalize-space()='Master Data']
    Mouse Over   xpath=//span[normalize-space()='Executive Masters']
    Click Element    xpath=//span[normalize-space()='Group']
    Sleep   3s
    Click Button    xpath=//button[normalize-space()='Add New']
    Sleep    3s
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id='name']  ${Executive_Group_master_value}  
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep   3s
     ${name_entered}    Get Value    css=#name
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${Cdb_name}
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    ${sql_query}=    Set Variable    SELECT name FROM executive_group_master WHERE name='${name_entered}' LIMIT 1;
    Log To Console    ${sql_query}
    ${result} =    Execute Sql String    ${sql_query}
    Run Keyword If    '${result}' == '[]'    Fail    "Value '${name_entered}' was not found in the database"
    Log To Console    "Value '${name_entered}' found in the database successfully"
    Disconnect From Database

Edit and Delete executive group master
    Click Element    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-bte7tm']//*[name()='svg']
    Sleep  3s
    Click Element    xpath=//div[@role='gridcell']//button[@type='button']//*[name()='svg']
    Click Element    xpath=//p[normalize-space()='Edit']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id='name']  ${Executive_Group_master_value}  
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep    3s
    Click Element    xpath=//div[@role='gridcell']//button[@type='button']//*[name()='svg']
    Click Element    xpath=//p[normalize-space()='Delete']
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Delete']
    Click Button    xpath=//button[normalize-space()='Delete']

Adding executive group master field again
    Sleep    3s
    Click Element    xpath=//button[@aria-label='Add New']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id="name"]   ${Executive_Group_master_value}  
    Click Button    xpath=//button[normalize-space()='Submit']
    Click Element    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-bte7tm']//*[name()='svg']
    