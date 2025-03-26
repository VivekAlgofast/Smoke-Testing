*** Settings ***
Library           SeleniumLibrary
Library    XML
Library           OperatingSystem
Library           pymysql
Library           DatabaseLibrary

Resource        ../Mainsuite/Variables.robot
*** Keywords ***

Allocation Form Keyword
    Set Selenium Implicit Wait    3s
    Wait Until Element Is Enabled    xpath=//a[.//span[text()='Administration']]    20s
    # Click Element    xpath=//a[.//span[text()='Administration']]
    # Wait Until Element Is Visible    xpath=//a[normalize-space()='Check Automation']
    # Double Click Element   xpath=//a[normalize-space()='Check Automation']
    # Sleep    10s
    # # Wait Until Element Is Visible    xpath=//div[contains(@class, 'MuiBox-root')]
   # Execute Javascript  document.querySelector("body section div[class='MuiPaper-root MuiPaper-elevation MuiPaper-elevation0 MuiDrawer-paper MuiDrawer-paperAnchorLeft MuiDrawer-paperAnchorDockedLeft css-1l8j5k8'] div div:nth-child(2) div:nth-child(1) a:nth-child(1) div:nth-child(1) div:nth-child(1) svg")
   # Sleep    5s
    Click Element    xpath=//a[.//span[text()='Administration']]
    Wait Until Element Is Visible    xpath=//span[normalize-space()='Master Data']
    Click Element    xpath=//span[normalize-space()='Master Data']
    # Click Element    xpath=//span[normalize-space()='Enquiry Masters']
    Execute Javascript    window.scrollTo(95, 715);
    Click Element    xpath=//span[normalize-space()='Allocation Type']
    Sleep    3s
    Click Button    xpath=//button[normalize-space()='Add New']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id='name']    ${Allocation_value}
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep    3s
    ${name_entered}    Get Value    css=#name
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${Cdb_name}  # This is the company-specific database

    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    ${sql_query}=    Set Variable    SELECT name FROM allocation_type_master WHERE name='${name_entered}' LIMIT 1;
    Log To Console    ${sql_query}  
    ${result} =    Execute Sql String    ${sql_query}
    Run Keyword If    '${result}' == '[]'    Fail    "Value '${name_entered}' was not found in the database"
    Log To Console    "Value '${name_entered}' found in the database successfully"
    Disconnect From Database

Edit and Delete Allocation
     Click Element    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-bte7tm']//*[name()='svg']
     Sleep  3s
    Click Element    xpath=//div[@role='gridcell']//button[@type='button']//*[name()='svg']
    Click Element    xpath=//p[normalize-space()='Edit']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id='name']  ${Allocation_value}
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep    3s
    #Wait Until Element Is Visible    xpath=//div[@role='gridcell']//button[@type='button']//*[name()='svg']
    Click Element    xpath=//div[@role='gridcell']//button[@type='button']//*[name()='svg']
    Click Element    xpath=//p[normalize-space()='Delete']
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Delete']
    Click Button    xpath=//button[normalize-space()='Delete']
    

Adding allocation field again
    Sleep    3s
    Click Element    xpath=//button[@aria-label='Add New']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id="name"]   ${Allocation_value}
    Click Button    xpath=//button[normalize-space()='Submit']
    Click Element    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-bte7tm']//*[name()='svg']