*** Settings ***

Resource    ../Flow2/Actionform.robot
# Resource    C:/Robotframework/Flow1/signinandUM.robot
Resource    ../Flow2/Categoryform.robot
Library     SeleniumLibrary
# Library     Browser
Resource    ../Flow2/AllocationMaster.robot
Resource    ../Flow2/ContactGroupform.robot
Resource    ../Flow2/ContactMaster.robot
Resource    ../Flow2/Departmentform.robot
Resource    ../Flow2/Productmaster.robot
Resource    ../Flow2/Enquiry_sub_status.robot
Resource    ../Flow1/LoginTosys.robot  #### Login keyword
Resource    ../Flow2/ExeutiveDepartment.robot
Resource    ../Flow2/ExecutiveGroup.robot
Resource    ../Flow2/ExecutiveRole.robot
Resource    ../Flow2/ProductGroup.robot
Resource    ../Flow2/Productunit.robot
Resource    ../Flow2/Organisationmaster.robot
Resource    ../Flow2/SourceMaster.robot
Resource    ../Flow2/Executivearea.robot
Resource    ../Flow2/statemaster.robot
Resource    ../Flow2/ExecutiveForm.robot
Resource    ../Database/Datacleanupkeywords.robot
Resource    ../Flow2/Countryform.robot
Resource     ../Mainsuite/customkeyword.robot
Resource    ../Flow3/enquiry.robot
Resource    ../Flow3/callExplorer.robot
Resource    ../Flow3/support.robot
# Resource    ../Flow2/CompanyForm.robot

Suite Setup 
...    Login With Valid Credentials

Suite Teardown
...    Close Browser


*** Test Cases ***

Run All Test Cases  
    Run All Test Cases With Error Handling    @{test_case}


# Company Form test Case
#     Company Form Keyword
#     Edit and Delete Company
    
    
Action Form test Case
    Clean up the DB for Action
    Click on Company Keyword
    Action Form Keyword
    Edit and Delete Action
    Adding action field again

# Allocation form Test Case
#     Clean up the DB for allocation
#     Allocation Form Keyword
#     Edit and Delete Allocation
#     Adding allocation field again

category form Test Case
    Clean up the DB for Category
    Category Form Keyword
    Edit and Delete Category
    Adding Category field again
    
Contact Group form Test Case
    Clean up the DB for ContactGroup
    contact group Form Keyword
    Edit and Delete Contact Group
    Adding Contact Group field again
    
Contact Master form Test Case
      Clean up the DB for contact master
      contact master Form Keyword
      Edit and Delete ContactMaster
      Adding ContactMaster field again
     

Country Master Form Test Case
    Clean up the DB for country master
    country Form Keyword
    Edit and Delete country master
    Adding country master field again
    

# Department Master form Test Case
#       Clean up the DB for department master
#       Department master Form Keyword
#       Edit and Delete Department master
#       Adding Department master field again


Product unit master form Test Case
    Clean up the DB for Product Unit master
    Product unit master Form Keyword
    Edit and Delete productunit master
    Adding productunit master field again
    
Enquiry Product Master Form Test Case
    Clean up the DB for Product master
    Product master Form Keyword
    Edit and Delete Product master
    Adding Product master field again
    

Executive dept Master Form Test Case
    Clean up the DB for Executivedept
    Executivedept master Form Keyword
    Edit and Delete Executivedept master
    Adding Executivedept master field again

    
Executive Group Master Form Test Case
    Clean up the DB for Executivegroup
    ExecutiveGroup master Form Keyword
    Edit and Delete executive group master
    Adding executive group master field again
 

Executive Role master form Test Case
    ExecutiveRole master Form Keyword
    

Product group master form Test Case
    Clean up the DB for Product Group master
    Product Group master Form Keyword
    Edit and Delete productgroup master
    Adding productgroup master field again
 

Orgainsation Master form Test Case
    Clean up the DB for organisation master
    organisation master Form Keyword
    Edit and Delete Orgainsation master
    Adding Organisation master field again
    

Source Master form Test Case
    Clean up the DB for Source
    Source master Form Keyword
    Edit and Delete Source master
    Adding Source master field again

State Master Form Test Case
    Clean up the DB for State Master
    State master form Keyword
    Edit and Delete State master
    Adding State master field again
    

Executive Master Form Test Case
    Executive master Form Keyword
    Edit and Delete Executive master
    Adding Executive master field again
    Sleep    3s

Executive Area Form Test Case
    Clean up the DB for Area
    Area master Form Keyword
    Edit and Delete Area master
    Adding Area master field again


Enquiry Page Test Case
     Clean up the DB for Enquiry
     Sleep    5s
     Enquiry Page Keyword

Call Explorer Enq Test Case
    Call Explorer Page Keyword
    Common Page Actions
    Call Explorer Page Keyword
    Status Update Keyword


Support Page Test Case
          Clean up the DB for Support
          Sleep    5s
          Support Page Keyword

Call Explorer Support Test Case
    Call Explorer Page Keyword
    Support Tab Keyword
    Common Page Actions
    Call Explorer Page Keyword
    Support Tab Keyword
    Status Update Keyword



    