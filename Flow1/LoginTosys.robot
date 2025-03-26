*** Settings ***
Library           SeleniumLibrary
Library    XML
Library           OperatingSystem
Resource    ../Mainsuite/Variables.robot

*** Keywords ***
Login With Valid Credentials 
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Page Should Contain Element   xpath=//*[@id="usercontact"]
    Input Text    xpath=//*[@id="usercontact"]  ${VALID_EMAIL}
    Input Text    xpath=//*[@id="password"]   ${VALID_PASSWORD}
    Double Click Element    xpath=//button[@id=':Rdlajsq:']
    Wait Until Element Is Visible    xpath=//button[@aria-label='Add New']
    Sleep    5s
    
    
    
    
    #Wait Until Element Is Visible    xpath=//h6[normalize-space()='Company List']