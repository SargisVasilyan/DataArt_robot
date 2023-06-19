*** Settings ***
Documentation                                   Test cases to verify that Contact Us form works correctly
Resource                                        ../Resources/Common.robot
Resource                                        ../Resources/DataArtapp.robot
Test Setup                                      Start the test
Test Teardown                                   End the test

# run   robot -d results  .\Tests\ContactUsPagetest.robot  to run tests    of this testsuit
# run   robot -d results  .\Tests to run all the tests

*** Variables ***
${short_name_warning}                           name must be at least 3 characters
${long_name_warning}                            name must be at most 80 characters
${short_phone_warning}                          phone must be at least 6 characters
${long_phone_warning}                           phone must be at most 20 characters
${mixed_phone_warning}                          phone must match
${invalid_email_warning}                        Please, enter your email in format email@domain.com
${short_company_warning}                        company must be at least 3 characters
${long_company_warning}                         company must be at most 255 characters
${short_add_info_warning}                       additionalInfo must be at least 3 characters
*** Test Cases ***

Valid "contact-us" form
    [Documentation]                             positive test case filling valid values in all fields
    [Tags]                                      contact  smoke
    ContactUsPage.Navigate to Contact-us page
    ContactUsPage.Show all fields
    DataArtapp.Fill Valid Form
    #wait until page contains                   Thank you for contacting us!


Invalid short "name"
    [Documentation]                             providing invalid short name with 2 characters
    [Tags]                                      contact  smoke   name
    ContactUsPage.Navigate to Contact-us page
    ContactUsPage.Show all fields
    DataArtapp.Fill Invalid Small "Name" Form
    page should contain                         ${short_name_warning}

Invalid long "name"
    [Documentation]                             providing invalid long name with 80+ character(81)
    [Tags]                                      contact  smoke   name
    ContactUsPage.Navigate to Contact-us page
    ContactUsPage.Show all fields
    DataArtapp.Fill Invalid Large "Name" Form
    WAIT UNTIL PAGE CONTAINS                    ${long_name_warning}

Invalid short "phone'
    [Documentation]                             providing invalid short "phone" with <6 numbers (5)
    [Tags]                                      contact  smoke   phone
    ContactUsPage.Navigate to Contact-us page
    ContactUsPage.Show all fields
    DataArtapp.Fill Invalid Small "Phone" Form
    page should contain                         ${short_phone_warning}

Invalid long "phone"
    [Documentation]                             providing invalid long "phone" with 20+ numbers(21)
    [Tags]                                      contact  smoke   phone
    ContactUsPage.Navigate to Contact-us page
    ContactUsPage.Show all fields
    DataArtapp.Fill Invalid Large "Phone" Form
    page should contain                         ${long_phone_warning}

Invalid "phone" with other chars
    [Documentation]                             providing invalid "phone" with Chars (not numbers)
    [Tags]                                      contact  smoke   phone
    ContactUsPage.Navigate to Contact-us page
    ContactUsPage.Show all fields
    DataArtapp.Fill Invalid "Phone" with Characters Form
    sleep    2s
    page should contain                         ${mixed_phone_warning}

Invalid "email"
    [Documentation]                             providing invalid email (without domain)
    [Tags]                                      contact  smoke   email
    ContactUsPage.Navigate to Contact-us page
    ContactUsPage.Show all fields
    DataArtapp.Fill Invalid "Email" Form
    page should contain                         ${invalid_email_warning}

Invalid short "company" name
    [Documentation]                             providing invalid short "Company" name with < three numbers (2)
    [Tags]                                      contact  smoke   company
    ContactUsPage.Navigate to Contact-us page
    ContactUsPage.Show all fields
    DataArtapp.Fill Invalid Small "Company" Form
    page should contain                         ${short_company_warning}

Invalid long "company" name
    [Documentation]                             providing invalid long "Company" name with 255+ characters (256)
    [Tags]                                      contact  smoke   company
    ContactUsPage.Navigate to Contact-us page
    ContactUsPage.Show all fields
    DataArtapp.Fill Invalid Large "Company" Form
    page should contain                         ${long_company_warning}

Invalid short "additionalinfo"
    [Documentation]                             providing invalid short "additionalinfo" with < three numbers (2)
    [Tags]                                      contact  smoke   additionalinfo
    ContactUsPage.Navigate to Contact-us page
    ContactUsPage.Show all fields
    DataArtapp.Fill Invalid Small "Discussion" Form
    page should contain                         ${short_add_info_warning}