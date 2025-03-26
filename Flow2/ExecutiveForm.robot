*** Settings ***
Library           SeleniumLibrary
Library    XML
Library           OperatingSystem
Library           pymysql
Library           DatabaseLibrary
Resource          ../Mainsuite/Variables.robot
   
*** Keywords ***


Executive master Form Keyword
    Sleep    3s
    Wait Until Element Is Enabled    xpath=//a[.//span[text()='Administration']]    20s
    # Click Element    xpath=//*[name()='path' and contains(@d,'M3 18h18v-')]
    Click Element    xpath=//a[.//span[text()='Administration']]
    Wait Until Element Is Visible    xpath=//span[normalize-space()='Master Data']
    Mouse Over    xpath=//span[normalize-space()='Master Data']
    Mouse Over   xpath=//span[normalize-space()='Executive Masters']
    Click Element    xpath=//span[normalize-space()='Executives']
    Sleep   3s
    Click Element    xpath=//div[@class='MuiDataGrid-row MuiDataGrid-row--lastVisible']//button[@type='button']//*[name()='svg']
    Click Element    xpath=//p[normalize-space()='Delete']
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Delete']
    Click Button    xpath=//button[normalize-space()='Delete']
    Sleep  3s
    Click Button    xpath=//button[normalize-space()='Add New']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id='name']  ${Executive_name}
    Click Element    xpath=//input[@id='department']
    Input Text    xpath=//input[@id='department']    ${Executive_department_master_value}
    Sleep    2s
    Press Keys    xpath=//input[@id='department']    ENTER
    Sleep    2s
    Click Element    xpath= //input[@id='role' and @name='role']
    Input Text    xpath= //input[@id='role' and @name='role']    ${Executive_Role_master_value}
    Sleep    2s
    Press Keys    xpath= //input[@id='role' and @name='role']    ENTER
    Sleep    2s
    Click Element   xpath= //input[@id='report_to']
    Input Text  xpath=//input[@id='report_to']   Automation User
    Sleep    2s
    Press Keys    xpath= //input[@id='report_to']    ENTER
    Click Element    xpath=//input[@id='email']
    Input Text    xpath=//input[@id='email']   ${Executive_email}
    Click Element    xpath=//input[@id='mobile']
    Input Text    xpath=//input[@id='mobile']    ${Executive_mobile}
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep   3s
     ${name_entered}    Get Value    css=#name
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${Cdb_name}
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    ${sql_query}=    Set Variable    SELECT name FROM executive_master WHERE name='${name_entered}' LIMIT 1;
    Log To Console    ${sql_query}
    ${result} =    Execute Sql String    ${sql_query}
    Run Keyword If    '${result}' == '[]'    Fail    "Value '${name_entered}' was not found in the database"
    Log To Console    "Value '${name_entered}' found in the database successfully"
    Disconnect From Database

Edit and Delete Executive master
    Click Element    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-bte7tm']//*[name()='svg']
    Sleep  3s
    Click Element    xpath=//div[@class='MuiDataGrid-row MuiDataGrid-row--lastVisible']//button[@type='button']//*[name()='svg']
    Click Element    xpath=//p[normalize-space()='Edit']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id='name']  ${Executive_name}
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep    3s
    Click Element    xpath=//div[@class='MuiDataGrid-row MuiDataGrid-row--lastVisible']//button[@type='button']//*[name()='svg']
    Click Element    xpath=//p[normalize-space()='Delete']
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Delete']
    Click Button    xpath=//button[normalize-space()='Delete']
    
Adding Executive master field again
    Sleep    3s
    Click Button    xpath=//button[normalize-space()='Add New']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id='name']  ${Executive_name}
    Click Element    xpath=//input[@id='department']
    Input Text    xpath=//input[@id='department']    ${Department_master_value}
    Press Keys    xpath=//input[@id='department']    ENTER
    Click Element    xpath= //input[@id='role' and @name='role']
    Input Text    xpath= //input[@id='role' and @name='role']    ${Executive_Role_master_value}
    Press Keys    xpath= //input[@id='role' and @name='role']    ENTER
    Sleep    2s
    Click Element   xpath= //input[@id='report_to']
    Input Text  xpath=//input[@id='report_to']   Automation User
    Sleep    2s
    Press Keys    xpath= //input[@id='report_to']    ENTER
    Click Element    xpath=//input[@id='email']
    Click Element    xpath=//input[@id='mobile']
    Input Text    xpath=//input[@id='mobile']    ${Executive_mobile}
    Click Button    xpath=//button[normalize-space()='Submit']
    Click Element    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-bte7tm']//*[name()='svg']