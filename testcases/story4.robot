*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  Collections
Library  String


*** Variables ***
${base_url}     http://localhost:8080
${content_type}    application/json
${url}   http://localhost:8080/
${browser}      chrome
${uploadfiletest}       xpath=//*[@id="contents"]/div[1]/div[2]/input
${addfile1}       C:/Users/joyli/Desktop/Challenge/uploadpass.csv
&{expectedResultsDict}=  S100$$$$$$$=5450.00  S200$$$$$$=3307.55  S300$$$$$=0  S400$$$$=3596.00  S610$$$$$$=50  S710$$$$$$=5850


*** Test Cases ***
test for upload csv file
    open browser    ${url}     ${browser}
    maximize browser window
    set selenium speed      1second

    upload file1
    click button    //button[normalize-space()='Refresh Tax Relief Table']
    scroll element into view       //h1[normalize-space()='Total Tax Relieves']
    sleep  2


Get tax relief data
    ${header}    create dictionary    content-type=${content_type}  user-agent=robotframework
    create session  mysession   ${base_url}

    ${response}=  get on session    mysession    /calculator/taxRelief    headers=${header}

    FOR     ${item}     IN  @{response.json()}
        ${natid}=  Set variable    ${item['natid']}
        ${actualTaxRelief}=  Set variable    ${item['relief']}
        ${expectedTaxRelief}=  Set variable    ${expectedResultsDict}[${natid}]
        ${resultMsg} =   Catenate    Expected Tax Relief for    ${natid}    is  ${expectedTaxRelief}    and actual result is    ${actualTaxRelief}

        Should Be Equal As Numbers  ${actualTaxRelief}  ${expectedTaxRelief}
        log to console    ${natid}
        Log To Console    ${resultMsg}
        
    END


*** Keywords ***
upload file1
    choose file     ${uploadfiletest}    ${addfile1}


