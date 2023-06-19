*** Settings ***
Library                                  SeleniumLibrary
Library                                  String


*** Variables ***
${random_string}                         ${EMPTY}
${domain}                                @gmail.com
${Contact_Us_link}                       css=a.Button.Header-Contact[href="/contact-us"]
${Contact_Us_header_label}               We’d love to hear from you
${name_field}                            css=input[name='name']
${phone_field}                           css=input[name='phone']
${email_field}                           css=input[name='email']
${company_field}                         css=input[name='company']
${additionalinfo_field}                  css=input[name='additionalInfo']
${privacy_checkbox}                      css=input[name='privacyAgreement']
${submit_button}                         css=button[type="submit" ]
${show_all_fields_button}                xpath=//button[contains(@class, 'Button_view_link-secondary')]


*** Keywords ***

Navigate to Contact-us page
    click link                           ${Contact_Us_link}
    wait until page contains             ${Contact_Us_header_label}


Fill in "Name" input field
    [Arguments]                          ${length}
    ${random_string}=                    generate random string      ${length}
    input text                           ${name_field}      ${random_string}

Fill in valid "Phone" number
    [Arguments]                          ${length}
    ${random_string}=                    generate random string      ${length}    [NUMBERS]
    input text                           ${phone_field}     ${random_string}



Fill in invalid "Phone" number
    [Arguments]                          ${length}
    ${random_string}=                    generate random string      ${length}    [LETTERS][NUMBERS]
    input text                           ${phone_field}     ${random_string}
    #Execute JavaScript                  document.activeElement.blur()



Fill in valid "Email"
    [Arguments]                          ${length}
    ${random_string}=                    generate random string      ${length}    [LETTERS][NUMBERS]
    input text                           ${email_field}     ${random_string}${domain}

Fill in invalid "Email"
    [Arguments]                          ${length}
    ${random_string}=                    generate random string      ${length}    [LETTERS][NUMBERS]
    input text                           ${email_field}     ${random_string}

Fill in "Company" field
    [Arguments]                          ${length}
    ${random_string}=                    generate random string      ${length}
    input text                           ${company_field}      ${random_string}

Fill in "discussion" field
    [Arguments]                          ${length}
    ${random_string}=                    generate random string      ${length}
    input text                           ${additionalinfo_field}      ${random_string}

Select "Privacy Policy" checkbox
    select checkbox                      ${privacy_checkbox}

Submit Contact
    click button                         ${submit_button}

Show all fields
    page should not contain element      ${phone_field}
    click button                         ${show_all_fields_button}
    wait until page contains element     ${phone_field}

Submit must be possible
    element should be enabled            ${submit_button}

Submit must be impossible
    element should be disabled           ${submit_button}