*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TIMEOUT}                   30s
${GOOGLE_URL}                https://www.google.com
${COOKIES_ACCEPT_BUTTON}     //div[contains(@class, 'QS5gu') and contains(@class, 'sy4vM')]
${SEARCH_BAR}                //textarea[contains(@class, 'gLFyf')]
${SEARCH_CONTENT}            Nokia Wikipedia
${NOKIA_WIKI_ADDRESS}        //h3[contains(@class, 'LC20lb') and contains(@class, 'MBeuO') and contains(@class, 'DKV0Md')]
${YEAR_XPATH_TITLE}          //*[@title=1865]
${SCREENSHOT_FILE}           D:\Nowyfolder\Nokia_Wiki_Site_Screenshot.png
${NOKIA_TITLE_ADDRESS}       //span[contains(@class, 'mw-page-title-main')]

*** Test Cases ***
Search Nokia on Google and Verify Wikipedia Page
    Set Selenium Timeout    ${TIMEOUT}
    Open Browser    ${GOOGLE_URL}    firefox
    Wait Until Element Is Visible    ${COOKIES_ACCEPT_BUTTON}
    Click Element    ${COOKIES_ACCEPT_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_BAR}
    Input Text    ${SEARCH_BAR}    ${SEARCH_CONTENT}
    Press Keys    ${SEARCH_BAR}    RETURN
    Wait Until Element Is Visible    ${NOKIA_WIKI_ADDRESS}
    Click Element    ${NOKIA_WIKI_ADDRESS}
    Wait Until Page Contains Element    ${YEAR_XPATH_TITLE}
    Capture Page Screenshot    ${SCREENSHOT_FILE}
    Element Text Should Be    ${NOKIA_TITLE_ADDRESS}    Nokia
    Element Text Should Be    ${YEAR_XPATH_TITLE}    1865
    [Teardown]    Close Browser
