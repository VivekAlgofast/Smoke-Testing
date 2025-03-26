*** Settings ***
Library           SeleniumLibrary
Library    XML

*** Variables ***
${BASE_URL}       http://localhost:3006/
${EMAIL_FIELD}    xpath=//*[@id="usercontact"]
${PASSWORD_FIELD}  xpath=//*[@id="password"]
${SIGN_IN_BUTTON}  xpath=//button[contains(text(),'Sign In')]
# ${ERROR_MESSAGE}  //*[@class='error-message']
${VALID_EMAIL}    tanushreekapoor@gmail.com
${VALID_PASSWORD}  User@1234
# ${INVALID_EMAIL}  invalid@example.com
# ${INVALID_PASSWORD} invalidpass


   
*** Keywords ***
# Sign 
#     Open Browser    ${BASE_URL}    Chrome
#     Maximize Browser Window

# Verify UI Elements
#     Page Should Contain Element   xpath=//*[@id="usercontact"]
   

Login With Valid Credentials
    Open Browser    ${BASE_URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element   xpath=//*[@id="usercontact"]
    Input Text    xpath=//*[@id="usercontact"]    ${VALID_EMAIL}
    Input Text    xpath=//*[@id="password"]    ${VALID_PASSWORD}
    Click Button    xpath=//button[contains(text(),'Sign In')]
    

Company and User Mangement
    Sleep    5s
    Double Click Element   xpath=//a[text()='MyCo']
    Sleep    5s
    # Click Element    xpath=/html[1]/body[1]/section[1]/header[1]/div[1]/button[3]/div[1]
    Execute JavaScript    document.querySelector(".MuiBox-root.css-teamt2").click()
    Sleep    5s
    Click Element    xpath=//li[contains(text(),'Profile')]
    Sleep    5s
    Click Element    xpath=(//input[@id='name'])[1]
    Sleep    3s
    Scroll Element Into View    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//button[@type='submit']
    Wait Until Element Is Enabled    xpath=//button[@type='submit']
    Sleep    5s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'MuiBox-root')]
    Execute JavaScript    document.querySelector(".MuiBox-root.css-teamt2").click()
    Sleep    5s
    Click Element     xpath=//li[normalize-space()='Logout']
    Sleep    5s
    Click Button    xpath=//button[normalize-space()='Yes']
    Sleep    3s
    Wait Until Element Is Visible    xpath=//*[@id="usercontact"]
    Sleep    3s