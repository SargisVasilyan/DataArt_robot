*** Settings ***
Resource                            ./Pages/ContactUsPage.robot
Resource                            ./Pages/HomePage.robot


*** Variables ***
${company_page_label}               Our Values
${clients_page_label}               trust of some of the world’s leading brands
${services_page_label}              Our bespoke services span design
${industries_page_label}            We deliver real value to clients
${blog_page_label}                  Finance
${dataart_main_title}               DataArt – Enterprise Software Development Company
${company_page_title}               About DataArt | Enterprise Software Development Company
${clients_page_title}               Client Success Stories | DataArt
${services_page_title}              Services & Technology | DataArt
${industries_page_title}            Our Industry-Specific Expertise | DataArt
${external_links_title}             DataArt – Enterprise Software Development Company
${privacy_policy_label}             DataArt Privacy and Cookie Policy

*** Keywords ***
Fill Valid Form
    ContactUsPage.Fill in "Name" input field            11
    ContactUsPage.Fill in valid "Phone" number          9
    ContactUsPage.Fill in valid "Email"                 5
    ContactUsPage.Fill in "Company" field               6
    ContactUsPage.Fill in "discussion" field            33
    ContactUsPage.Select "Privacy Policy" checkbox
    ContactUsPage.Submit must be possible
    ContactUsPage.Submit Contact

Fill Invalid "Email" Form
    ContactUsPage.Fill in "Name" input field            11
    ContactUsPage.Fill in invalid "Email"               5
    ContactUsPage.Fill in valid "Phone" number          9
    ContactUsPage.Submit must be impossible

Fill Invalid Small "Name" Form
    ContactUsPage.Fill in "Name" input field            2
    ContactUsPage.Submit must be impossible

Fill Invalid Large "Name" Form
    ContactUsPage.Fill in "Name" input field            81
    ContactUsPage.Submit must be impossible

Fill Invalid Small "Phone" Form
    ContactUsPage.Fill in valid "Phone" number          5
    ContactUsPage.Fill in "Name" input field            11
    ContactUsPage.Submit must be impossible

Fill Invalid Large "Phone" Form
    ContactUsPage.Fill in valid "Phone" number          21
    ContactUsPage.Fill in "Name" input field            11
    ContactUsPage.Submit must be impossible

Fill Invalid "Phone" with Characters Form
    ContactUsPage.Fill in invalid "Phone" number        10
    ContactUsPage.Fill in "Name" input field            11
    ContactUsPage.Submit must be impossible

Fill Invalid Small "Company" Form
    ContactUsPage.Fill in "Name" input field            11
    ContactUsPage.Fill in valid "Phone" number          9
    ContactUsPage.Fill in "Company" field               2
    ContactUsPage.Fill in valid "Email"                 5
    ContactUsPage.Submit must be impossible

Fill Invalid Large "Company" Form
    ContactUsPage.Fill in "Name" input field            11
    ContactUsPage.Fill in valid "Phone" number          9
    ContactUsPage.Fill in "Company" field               256
    ContactUsPage.Fill in valid "Email"                 5
    ContactUsPage.Submit must be impossible

Fill Invalid Small "Discussion" Form
    ContactUsPage.Fill in "Name" input field            11
    ContactUsPage.Fill in valid "Phone" number          9
    ContactUsPage.Fill in valid "Email"                 5
    ContactUsPage.Fill in "discussion" field            2
    ContactUsPage.Fill in "Company" field               11
    ContactUsPage.Submit must be impossible

Navigate to "Company" page
    HomePage.Click "Company" link
    wait until page contains                            ${company_page_label}
    title should be                                     ${company_page_title}

Navigate to "Clients" page
    HomePage.Click "Clients" link
    wait until page contains                            ${clients_page_label}
    title should be                                     ${clients_page_title}

Navigate to "Services" page
    HomePage.Click "Services" link
    wait until page contains                            ${services_page_label}
    title should be                                     ${services_page_title}

Navigate to "Industries" page
    HomePage.Click "Industries" link
    wait until page contains                            ${industries_page_label}
    title should be                                     ${industries_page_title}

Navigate to "Blog" page
    HomePage.Click "Blog" link
    wait until page contains                            ${blog_page_label}
    title should be                                     ${dataart_main_title}

Navigate to "facebook"
    HomePage.Click "facebook" link
    title should be                                     ${external_links_title}

Navigate to "twitter"
    HomePage.Click "twitter" link
    title should be                                     ${external_links_title}

Navigate to "dataart.medium.com"
    HomePage.Click "dataart.medium.com" link
    title should be                                     ${external_links_title}

Navigate to "linkedin"
    HomePage.Click "linkedin" link
    title should be                                     ${external_links_title}

Navigate to "privacy-policy"
    HomePage.Click "privacy-policy" link
    title should be                                     ${dataart_main_title}
    wait until page contains                            ${privacy_policy_label}
