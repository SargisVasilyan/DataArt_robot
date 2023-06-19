*** Settings ***
Library                             SeleniumLibrary
Resource                            ./Pages/ContactUsPage.robot

*** Variables ***
${BROWSER} =                        chrome
${BASE_URL} =                       https://dataart.com

*** Keywords ***
Start the test
    open browser                    about:blank     ${BROWSER}
    maximize browser window
    go to                           ${BASE_URL}

End the test
    close all browsers

