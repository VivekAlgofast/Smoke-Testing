*** Variables ***
@{test_case}    Company Form test Case  Action Form test Case    Allocation form Test Case    category form Test Case    Contact Group form Test Case    Contact Master form Test Case    Country Master Form Test Case  Department Master form Test Case    Enquiry Product Master Form Test Case    Enquiry Sub Status Master Form Test Case    Executive dept Master Form Test Case    Executive Group Master Form Test Case    Executive Role master form Test Case    Product group master form Test Case    Product unit master form Test Case    Orgainsation Master form Test Case    Source Master form Test Case    State Master Form Test Case    Executive Master Form Test Case   Executive Area ster form test Case  Enquiry Page Test Case  Call Explorer Enq Test Case  Support Page Test Case  Call Explorer Support Test Case     


*** Keywords ***
Run All Test Cases With Error Handling
    [Arguments]    @{test_cases} 
    FOR    ${test_case}    IN    @{test_cases}
         Run Keyword And Ignore Error    ${test_case}
    END
