*** Settings ***
Library           SeleniumLibrary
Library    XML
Library           OperatingSystem
Library           pymysql
Library           DatabaseLibrary
Resource      C:/Users/hp/Desktop/Smoke testing new/Myalgoutomation/Mainsuite/Varibles.robot
   
*** Keywords ***
Company Form Keyword
    Sleep    3s
    # Wait Until Element Is Visible    ${Company_path}
    # Click Element   ${Company_path}
    # Sleep    5s
    # # Execute Javascript  document.querySelector("body section div[class='MuiPaper-root MuiPaper-elevation MuiPaper-elevation0 MuiDrawer-paper MuiDrawer-paperAnchorLeft MuiDrawer-paperAnchorDockedLeft css-1l8j5k8'] div div:nth-child(2) div:nth-child(1) a:nth-child(1) div:nth-child(1) div:nth-child(1) svg")
    # Wait Until Element Is Enabled    xpath=//a[.//span[text()='Administration']]    20s
    # Click Element    xpath=//a[.//span[text()='Administration']]
    # Click Element    xpath=//span[normalize-space()='Master Data']
    # Click Element    xpath=//span[normalize-space()='Enquiry Masters']
    # Click Element    xpath=//span[normalize-space()='Action']
    Wait Until Element Is Visible    xpath=//button[@aria-label='Add New']
    Click Element    xpath=//button[@aria-label='Add New']
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id="name"]   ${Action_value}
    Click Button    xpath=//button[normalize-space()='Submit']
    # Wait Until Page Contains    Record Saved!
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

Edit and Delete Company
    Sleep    5s
    Click Element    xpath=//div[@class='MuiDataGrid-row MuiDataGrid-row--lastVisible']//button[@type='button']//*[name()='svg']
    Sleep   3s
    # Click Element    xpath=//div[@role='gridcell']//button[@type='button']//*[name()='svg']
    #Click Element    xpath=//svg[contains(@class, 'MuiSvgIcon-root') and contains(@class, 'css-vubbuv')]
    # Sleep    3s
    Click Element    xpath=//p[normalize-space()='Edit']
    Sleep    2s
    Wait Until Element Is Visible    xpath=//input[@id='name']
    Input Text    xpath=//input[@id='name']  ${Action_value}
    Sleep    2s
    #${name_entered}    Get Value    css=#name
    Click Button    xpath=//button[normalize-space()='Submit']
    Sleep    3s
    Click Element    xpath=//div[@class='MuiDataGrid-row MuiDataGrid-row--lastVisible']//button[@type='button']//*[name()='svg']
    Sleep    3s
    Click Element    xpath=//p[normalize-space()='Delete']
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Delete']
    Click Button    xpath=//button[normalize-space()='Delete']
    Sleep    3s

