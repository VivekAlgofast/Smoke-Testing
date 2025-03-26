*** Settings ***
Library           DatabaseLibrary
Library           SeleniumLibrary
Library           OperatingSystem
Library           pymysql
*** Variables ***
${DB_HOST}        192.168.1.200

${DB_PORT}        3306

${DB_NAME}        userDb

${DB_USER}        algofast

${DB_PASSWORD}    algofast@123

${C_Database_name}    crmapp412

*** Keywords ***
Clean up the DB for Action
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM enquiry_action_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM enquiry_source_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM enquiry_action_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database

Clean up the DB for Area
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM area_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM enquiry_source_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM area_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database


Clean up the DB for Source
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM enquiry_source_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM enquiry_source_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM enquiry_source_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database

Clean up the DB for Executivedept
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM executive_dept_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM executive_dept_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM executive_dept_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database
    
Clean up the DB for allocation
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM allocation_type_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM allocation_type_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM allocation_type_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database

Clean up the DB for Category
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM enquiry_category_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM enquiry_category_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM enquiry_category_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database

Clean up the DB for ContactGroup
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM contact_group_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM contact_group_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM contact_group_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database

Clean up the DB for contact master
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM contact_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM contact_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM contact_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database


Clean up the DB for country master
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM country_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM country_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM country_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database
    
Clean up the DB for currency master
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM currency_data WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM currency_data;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM currency_data;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database

Clean up the DB for department master
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM department_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM department_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM department_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database

Clean up the DB for Executivegroup
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM executive_group_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM executive_group_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM executive_group_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database

Clean up the DB for organisation master
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM organisation_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM organisation_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM organisation_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database

Clean up the DB for Product Group master
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM product_group_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM product_group_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM product_group_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database

Clean up the DB for Product master
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM product_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM product_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM product_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database
    
Clean up the DB for Product Unit master
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM unit_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM unit_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM unit_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database

Clean up the DB for State Master
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM state_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM state_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM state_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
     Disconnect From Database
    
Clean up the DB for enquiry_sub_status master
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM enquiry_sub_status_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM enquiry_sub_status_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM enquiry_sub_status_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database
    
Clean up the DB for Executiverole
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query}=    Set Variable    DELETE FROM executive_role_master WHERE 1=1;
    Execute Sql String    ${cleanup_query}
    # Disconnect from the database
    # ${check_query}=    Set Variable    SELECT COUNT(*) FROM executive_role_master;
    # ${result}=    Execute Sql String    ${check_query}

    # Log to console if the table is empty
    ${check_query}=    Set Variable    SELECT COUNT(*) FROM executive_role_master;
    ${result}=    Execute Sql String    ${check_query}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database



Clean up the DB for Enquiry
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    ${C_Database_name}  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query1}=    Set Variable    DELETE FROM enquiry_header_tran WHERE 1=1;
    Execute Sql String    ${cleanup_query1}

    ${cleanup_query2}=    Set Variable    DELETE FROM enquiry_ledger_tran WHERE 1=1;
    Execute Sql String    ${cleanup_query2}

    ${cleanup_query3}=    Set Variable    DELETE FROM enquiry_product_tran WHERE 1=1;
    Execute Sql String    ${cleanup_query3}


    # Log to console if the table is empty
    ${check_query1}=    Set Variable    SELECT COUNT(*) FROM enquiry_header_tran;
    ${check_query2}=    Set Variable    SELECT COUNT(*) FROM enquiry_ledger_tran;
    ${check_query3}=    Set Variable    SELECT COUNT(*) FROM enquiry_product_tran;
    ${result}=    Execute Sql String    ${check_query1}
    ${result}=    Execute Sql String    ${check_query2}
    ${result}=    Execute Sql String    ${check_query3}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database



Clean up the DB for Support
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${company_db}=    Set Variable    crmapp412  # This is the company-specific database

    # Connect to the company database using the correct connection parameters
    Connect To Database    pymysql    ${company_db}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT} 
    # Execute the SQL query
    # ${sql_query}=    Set Variable    INSERT INTO enquiry_action_master (name) VALUES ('JPGJ');
    ${cleanup_query1}=    Set Variable    DELETE FROM ticket_header_tran WHERE 1=1;
    Execute Sql String    ${cleanup_query1}

    ${cleanup_query2}=    Set Variable    DELETE FROM ticket_ledger_tran WHERE 1=1;
    Execute Sql String    ${cleanup_query2}

    ${cleanup_query3}=    Set Variable    DELETE FROM ticket_product_tran WHERE 1=1;
    Execute Sql String    ${cleanup_query3}


    # Log to console if the table is empty
    ${check_query1}=    Set Variable    SELECT COUNT(*) FROM ticket_header_tran;
    ${check_query2}=    Set Variable    SELECT COUNT(*) FROM ticket_ledger_tran;
    ${check_query3}=    Set Variable    SELECT COUNT(*) FROM ticket_product_tran;
    ${result}=    Execute Sql String    ${check_query1}
    ${result}=    Execute Sql String    ${check_query2}
    ${result}=    Execute Sql String    ${check_query3}

    # Log the result to inspect its structure
    Log To Console    "Query result: ${result}"
    Disconnect From Database
    
