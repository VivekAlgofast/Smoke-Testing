*** Settings ***
Library           SeleniumLibrary
Library    XML
Library           OperatingSystem

Resource          ../Mainsuite/Variables.robot

*** Keywords ***

Common Page Actions

    # Step 1: Click the initial input element
     Sleep   5s
    Click Element    xpath=/html/body/section/div/div/div[2]/span/div/div/div/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div[3]/span/input

    # Step 2: Verify visibility of a required element
    Wait Until Element Is Visible    xpath=/html/body/section/div/div/div[2]/span/div/div/div/div/div[4]/div/div[1]/div[2]/div[2]/div

    # Step 3: Scroll to the bottom of the page 
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight);

    # Step 4: Allocate Call
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Allocate Call']   
    Sleep  2s
    Click Element   xpath=//button[normalize-space()='Allocate Call']

    # # Step 5: Select Executive and Input Remarks

    Sleep   2s
    Click Element    xpath=//input[@id='allocated_to']
    sleep  1s
    Click Element    xpath=//li[@id='allocated_to-option-0']

    # Step 6: Input Remarks
    Click Element    xpath=//textarea[@id='suggested_action_remark']
    Input Text       xpath=//textarea[@id='suggested_action_remark']    ${Remarks}

    # Step 7: Submit the form
    Click Element    xpath=//button[normalize-space()='Submit']
    Sleep  5s
    Click Element    xpath=/html/body/section/div/div/div[2]/span/div/div/div/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div[3]/span/input
    Wait Until Element Is Visible    xpath=//div[@class='MuiBox-root css-0'][normalize-space()='${Remarks}']

    # Step 8: Toggle Details Visibility
    Sleep   3s
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
    Click Element    xpath=//button[normalize-space()='Hide Details']
    Sleep   3s
    Click Element    xpath=//button[normalize-space()='Show Details']

    # Step 12: Navigate to New Call Receipt
    Sleep   3s

    ${enquiry_exists}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//a[normalize-space()='New Enquiry']
    Run Keyword If    ${enquiry_exists}    Click Element    xpath=//a[normalize-space()='New Enquiry']
    Run Keyword Unless    ${enquiry_exists}    Click Element    xpath=//a[normalize-space()='New Support']

    # Step 13: Verify Enquiry or Support Ticket Details
    Sleep   2s
    ${is_element1_visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[contains(text(),'Enquiry Details')]
    ${is_element2_visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[contains(text(),'Support Details')]
    Run Keyword If             ${is_element1_visible} or ${is_element2_visible}    Log    "One of the elements is visible."
    Run Keyword Unless         ${is_element1_visible} or ${is_element2_visible}    Fail    "Neither of the elements is visible."

    # Step 14: Quit the Process
    Go Back
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Quit']
    Click Element    xpath=//button[normalize-space()='Quit']


    

Status Update Keyword
    # Step 9: Update Call Status
    Sleep  10s
    Click Element   xpath=/html/body/section/div/div/div[2]/span/div/div/div/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div[3]/span/input
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Status Update']
    Click Element   xpath=//button[normalize-space()='Status Update']
    Sleep   2s
    Click Element    xpath=//input[@id='action_taken']
    sleep  1s
    Click Element    xpath=//li[@id='action_taken-option-0'] 

    Wait Until Element Is Visible    xpath=//textarea[@id='action_taken_remark'] 
    Input Text       xpath=//textarea[@id='action_taken_remark']    ${REMARKS}

    # Step 10: Select Status and Actions
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
    Click Element    xpath=//input[@value='2']
    Click Element    xpath=//input[@id='sub_status']
    Wait Until Element Is Visible    xpath=//li[@id='sub_status-option-0']
    Click Element    xpath=//li[@id='sub_status-option-0']

    # Step 11: Enter Closure Remarks and Submit
    Input Text       xpath=//textarea[@id='closure_remark']    ${REMARKS}
    Click Element    xpath=//button[@type='submit']
    Sleep   2s


Support Tab Keyword
    Click Element   xpath=//button[normalize-space()='Support']

Call Explorer Page Keyword
    # Wait and scroll to the top of the page
    Execute Javascript    window.scrollTo(0, 0);

    
    # Navigate to a specific section
    Wait Until Element Is Visible    xpath=//a[@aria-label='Call Explorer']
    Click Element   xpath=//a[@aria-label='Call Explorer']
    Sleep    3s
    
    

