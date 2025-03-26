*** Settings ***
Library           SeleniumLibrary
Library           XML
Library           OperatingSystem
Library           DatabaseLibrary

Resource          ../Mainsuite/Variables.robot    


*** Keywords ***

Enquiry Page Keyword
    Sleep    5s

    # Open the sidebar and navigate
    Execute Javascript  document.querySelector("body section div[class='MuiPaper-root MuiPaper-elevation MuiPaper-elevation0 MuiDrawer-paper MuiDrawer-paperAnchorLeft MuiDrawer-paperAnchorDockedLeft css-1l8j5k8'] div div:nth-child(2) div:nth-child(1) a:nth-child(1) div:nth-child(1) div:nth-child(1) svg")
    Wait Until Element Is Visible    xpath=//*[name()='path' and contains(@d,'M3 18h18v-')]
    Click Element    xpath=//*[name()='path' and contains(@d,'M3 18h18v-')]

    Wait Until Element Is Visible    xpath=//span[normalize-space()='Workflows']
    Click Element    xpath=//span[normalize-space()='Workflows']

    Wait Until Element Is Visible    xpath=//span[normalize-space()='Enquiry Tickets']
    Click Element    xpath=//span[normalize-space()='Enquiry Tickets']


    Wait Until Element Is Visible    xpath=//button[normalize-space()='Add New']
    Click Element    xpath=//button[normalize-space()='Add New']

    # Wait for the "Enquiry Details" form to load
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Enquiry Details')]


    # Fill the Enquiry form
    Input Text    xpath=//input[@id='enq_number']  ${Description}


    # Select options for required fields
    Click Element    xpath=//input[@id='contact']
    sleep  1s
    Click Element    xpath=//li[@id='contact-option-0']

    Click Element    xpath=//input[@id='category']
    sleep  1s
    Click Element    xpath=//li[@id='category-option-0']

    Click Element    xpath=//input[@id='source']
    sleep  1s
    Click Element    xpath=//li[@id='source-option-0']

    Click Element    xpath=//input[@id='received_by']
    sleep  1s
    Click Element    xpath=//li[@id='received_by-option-0']

    Click Element    xpath=/html/body/section/div/div/div[2]/span/div/div/div/form/div[2]/div[1]/div[7]/div/div/div/div/div
    sleep  1s
    Click Element    xpath=/html/body/div/div/ul/li

    # Input remarks
    Input Text    xpath=//textarea[@id='call_receipt_remark']  ${Call_Receipt_Remarks}
    Input Text    xpath=//textarea[@id='suggested_action_remark']  ${Suggested_Action_Remarks}


    Click Element    xpath=//input[@id='action_taken']
    sleep  1s
    Click Element    xpath=//li[@id='action_taken-option-0']

     Click Element    xpath=//input[@id='allocated_to']
    sleep  1s
    Click Element    xpath=//li[@id='allocated_to-option-0']

     Click Element    xpath=//input[@id='pipeline']
    sleep  1s
    Click Element    xpath=//li[@id='pipeline-option-0']

    Click Element    xpath=//input[@id='stage']
    sleep  1s
    Click Element    xpath=//li[@id='stage-option-0']

    Click Element    xpath=//input[@id='next_action']
    sleep  1s
    Click Element    xpath=//li[@id='next_action-option-0']

    # Wait Until Element Is Visible    xpath=//button[normalize-space()='Submit']    10s
    Click Element    xpath=//button[normalize-space()='Submit']
    Sleep  5s

    # Database verification
    # Connect to the default database
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}

    # Check if the enquiry exists in the company-specific database
    ${company_db}=    Set Variable    crmapp412
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}

    # Verify enquiry exists in `enquiry_header_tran` table
    ${sql_query}=    Query    SELECT id FROM enquiry_header_tran WHERE enq_number = '${Description}' LIMIT 1;
    ${id}=    Set Variable    ${sql_query}[0][0]

    # Verify associated data in `enquiry_ledger_tran` and `enquiry_product_tran`
    ${sql_query2}=    Set Variable   SELECT enquiry_id FROM enquiry_ledger_tran WHERE enquiry_id = '${id}' LIMIT 1;
    ${result}=        Execute Sql String    ${sql_query2}
    Run Keyword If    '${result}' == '[]'    Fail    "Value '${Description}' was not found in enquiry_ledger_tran"

    ${sql_query3}=    Set Variable   SELECT enquiry_id FROM enquiry_product_tran WHERE enquiry_id = '${id}' LIMIT 1;
    ${result}=        Execute Sql String    ${sql_query3}
    Run Keyword If    '${result}' == '[]'    Fail    "Value '${Description}' was not found in enquiry_product_tran"

    # Log success and disconnect from the database
    Log To Console    "Value '${Description}' found in the database successfully"
    Disconnect From Database
