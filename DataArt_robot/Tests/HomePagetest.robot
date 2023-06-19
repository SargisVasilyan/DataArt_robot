*** Settings ***
Documentation       Test cases to verify that TopNavs and external links work correctly
Resource                                        ../Resources/Common.robot
Resource                                        ../Resources/DataArtapp.robot
Test Setup                                      Start the test
Test Teardown                                   End the test

# run   robot -d results  .\Tests\HomePagetest.robot  to run tests    of this testsuit
# run   robot -d results  .\Tests to run all the tests

*** Test Cases ***
Open "Company" page
    [Documentation]                             Verify that "Company" page opens correctly
    [Tags]                                      smoke    TopNav
    DataArtapp.Navigate to "Company" page
    log                                         "Company" page opens as expected

Open "Clients" page
    [Documentation]                             Verify that "Clients" page opens correctly
    [Tags]                                      smoke    TopNav
    DataArtapp.Navigate to "Clients" page
    log                                         "Clients" page opens as expected

Open "Services" page
    [Documentation]                             Verify that "Services" page opens correctly
    [Tags]                                      smoke    TopNav
    DataArtapp.Navigate to "Services" page
    log                                         "Services" page opens as expected

Open "Industries" page
    [Documentation]                             Verify that "Industries" page opens correctly
    [Tags]                                      smoke    TopNav
    DataArtapp.Navigate to "Industries" page
    log                                         "Industries" page opens as expected

Open "Blog" page
    [Documentation]                             Verify that "Blog" page opens correctly
    [Tags]                                      smoke    TopNav
    DataArtapp.Navigate to "Blog" page
    log                                         "Blog" page opens as expected

Open "Facebook"
    [Documentation]                             Verify that "facebook"  opens correctly
    [Tags]                                      smoke    externallinks
    DataArtapp.Navigate to "facebook"
    log                                         "facebook" opens as expected

Open "twitter"
    [Documentation]                             Verify that "twitter" opens correctly
    [Tags]                                      smoke    externallinks
    DataArtapp.Navigate to "twitter"
    log                                         "twitter" opens as expected

Open "dataart.medium"
    [Documentation]                             Verify that "dataart.medium.com" opens correctly
    [Tags]                                      smoke    externallinks
    DataArtapp.Navigate to "dataart.medium.com"
    log                                         "dataart.medium.com" opens as expected

Open "linkedin"
    [Documentation]                             Verify that "linkedin" opens correctly
    [Tags]                                      smoke    externallinks
    DataArtapp.Navigate to "linkedin"
    log                                         "Linkedin" opens as expected

Open "privacy_policy" page
    [Documentation]                             Verify that "privacy and cookie policy" opens correctly
    [Tags]                                      smoke
    DataArtapp.Navigate to "privacy-policy"
    log                                         "privacy and cookie policy" opens as expected
