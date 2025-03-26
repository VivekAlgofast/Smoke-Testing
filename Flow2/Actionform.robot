*** Settings ***
Library           SeleniumLibrary
Library           XML
Library           OperatingSystem
Library           pymysql
Library           DatabaseLibrary

Resource          ../Mainsuite/Variables.robot

*** Keywords ***

Click on Company Keyword 
  Sleep    3s
  Wait Until Element Is Visible    ${Company_path}
  Click Element   ${Company_path}
#   Sleep    5s

Action Form Keyword
    Sleep    3s
    click Element  xpath=//a[.//span[text()='Administration']]
    Mouse Over   xpath=//span[normalize-space()='Master Data']
    Mouse Over   xpath=//span[normalize-space()='Enquiry Masters']
    click element   xpath=//span[normalize-space()='Actions']
    Sleep     3s
    Wait Until Element Is Visible    xpath=//span[normalize-space()='ActionList']
    Click Element    xpath=//button[@aria-label='Add New']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id="name"]   ${Action_value}
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep    3s
    ${name_entered}    Get Value    css=#name
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${Cdb_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${sql_query}=    Set Variable    SELECT name FROM enquiry_action_master WHERE name='${name_entered}' LIMIT 1;
    Log To Console    ${sql_query}
  
    ${result} =    Execute Sql String    ${sql_query}

# Check if the result is not empty (meaning the record was found)
    Run Keyword If    '${result}' == '[]'    Fail    "Value '${name_entered}' was not found in the database"
    Log To Console    "Value '${name_entered}' found in the database successfully"

    # Disconnect from the database
    Disconnect From Database

Edit and Delete Action
    Click Element    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-bte7tm']//*[name()='svg']
    Sleep   3s
    Click Element    xpath=//div[@role='gridcell']//button[@type='button']//*[name()='svg']
    #Click Element    xpath=//svg[contains(@class, 'MuiSvgIcon-root') and contains(@class, 'css-vubbuv')]
    Sleep    3s
    Click Element    xpath=//p[normalize-space()='Edit']
    Sleep    2s
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id='name']  ${Action_value}
    Sleep    2s
    #${name_entered}    Get Value    css=#name
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep    3s
    Click Element    xpath=//div[@role='gridcell']//button[@type='button']//*[name()='svg']
    Sleep    3s
    Click Element    xpath=//p[normalize-space()='Delete']
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Delete']
    Click Button    xpath=//button[normalize-space()='Delete']
    Sleep    3s

Adding action field again
    Set Selenium Implicit Wait     3s
    Click Element    xpath=//button[@aria-label='Add New']
    Sleep    2s
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id="name"]   ${Action_value}
    Sleep    5s
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep    3s
    Click Element    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-bte7tm']//*[name()='svg']