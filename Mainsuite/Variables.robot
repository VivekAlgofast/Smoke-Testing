*** Variables ***
${BASE_URL}             http://192.168.1.200:3002/
${EMAIL_FIELD}    xpath=//*[@id="usercontact"]
${PASSWORD_FIELD}  xpath=//*[@id="password"]
${SIGN_IN_BUTTON}  xpath=//button[contains(text(),'Sign In')]
# ${ERROR_MESSAGE}  //*[@class='error-message']
${VALID_EMAIL}            automation@gmail.com
${VALID_PASSWORD}         User@1234   #password


@{TEST_CASES}    Action Form test Case    Allocation form Test Case    category form Test Case    Contact Group form Test Case    Contact Master form Test Case    Country Master Form Test Case    Currency Master form Test Case    Department Master form Test Case    Enquiry Product Master Form Test Case    Enquiry Sub Status Master Form Test Case    Executive dept Master Form Test Case    Executive Group Master Form Test Case    Executive Role master form Test Case    Product group master form Test Case    Product unit master form Test Case    Orgainsation Master form Test Case    Source Master form Test Case    State Master Form Test Case    Executive Master Form Test Case    Executive Area ster form test Case

${variable_path}=    Evaluate    os.path.join('Myalgoutomation', 'Mainsuite', 'Varibles.robot')


${DB_HOST}        192.168.1.200

${DB_PORT}        3306

${DB_NAME}        userDb

${DB_USER}        algofast

${DB_PASSWORD}    algofast@123

${Cdb_name}    crmapp412  ## Data base name a per the company

${Company_path}    xpath=//a[normalize-space()='Check Automation']

${Source_master_value}    Newspaper

${Area_value}    noida

${Product_unit_master_value}    HRDA

${Product_master_value}    HR Department

${Product_group_master_value}    HR Department

${Organisation_master_value}    Shivam pvt

${Executive_department_master_value}    HR Department

${Executive_Role_master_value}    Admin

${Executive_Group_master_value}    HR Department

${Executive_name}    Shivam Tyagi

${Executive_email}    shivamT@gmail.com

${Executive_mobile}    9999999998

${Sub_status_master_value}    HR Department

${Department_master_value}    HR Department

${currency_master_value}    Doller

${Currency_symbol}    $

${country_master_value}    India

${contact_master_value}    shivamvivektestnew

${contact_group_value}    shivamvivektestnew

${Category_value}    shivamvivektestnew

${Allocation_value}    shivamvivektestnew

${Action_value}    AllocateEnquiry

${country_master_value}    India

${State_master_value}      Uttar Pradesh


${Description}    This is the sample description
${Call_Receipt_Remarks}   This is the sample remarks
${Suggested_Action_Remarks}   This is the sample remarks

${Remarks}  Pl check
${Executive}  Automation User
 # Check Automation User


   