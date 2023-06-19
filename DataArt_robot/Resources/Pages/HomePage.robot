*** Settings ***
Library                                  SeleniumLibrary


*** Variables ***
${company_link}                          /company/about-us
${clients_link}                          /clients
${services_link}                         /services
${industries_link}                       /industries
${blog_link}                             /blog
${facebook_link}                         css=a.SocialButton[href*="facebook"]
${twitterlink}                           css=a.SocialButton[href*="twitter"]
${dataart.medium_link}                   css=a.SocialButton[href*="medium"]
${linkedin_link}                         css=a.SocialButton[href*="linkedin"]
${privacy_policy_link}                   /dataart-privacy-policy

*** Keywords ***
Click "Company" link
    click link    ${company_link}

Click "Clients" link
    click link    ${clients_link}

Click "Services" link
    click link    ${services_link}

Click "Industries" link
    click link    ${industries_link}

Click "Blog" link
    click link    ${blog_link}

Click "facebook" link
    click link    ${facebook_link}

Click "twitter" link
    click link    ${twitterlink}

Click "dataart.medium.com" link
    click link    ${dataart.medium_link}

Click "linkedin" link
    click link    ${linkedin_link}

HomePage.Click "privacy-policy" link
    click link    ${privacy_policy_link}





