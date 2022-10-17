*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}     http://localhost:8080
${content_type}    application/json
${data1}     {"birthday":"11121989","gender":"F","name":"SS","natid":"id01234563","salary":"8000","tax":"800"}
${data2}     {"birthday":"11-12-1989","gender":"F","name":"SS","natid":"id02234563","salary":"8000","tax":"800"}
${data3}     {"birthday":"11121989","gender":"Female","name":"SS","natid":"id1234563","salary":"8000","tax":"800"}
*** Test Cases ***
Insert single record success
    ${header}    create dictionary    content-type=${content_type}  user-agent=robotframework
    create session  mysession   ${base_url}     verify=true

    ${response}=  post on session    mysession    /calculator/insert  data=${data1}   headers=${header}
    #status should be 202
    open browser        ${base_url}     chrome
    maximize browser window
    element should be visible   //td[normalize-space()='id01$$$$$$']   id01$$$$$$

    log to console    ${response.status_code}
    log to console    ${response.content}
    sleep  2
    clear data
    sleep  2
    close browser

#Negative test case1
#    ${header}    create dictionary    content-type=${content_type}  user-agent=robotframework
#    create session  mysession   ${base_url}     verify=true
#    ${response}=  post on session    mysession    /calculator/insert  data=${data2}   headers=${header}
#    #status should be 500
#    log to console    ${response.status_code}
#    log to console    ${response.content}

#Negative test case2
#    ${header}    create dictionary    content-type=${content_type}  user-agent=robotframework
#    create session  mysession   ${base_url}     verify=true
#
#    ${response}=  post on session    mysession    /calculator/insert  data=${data3}   headers=${header}
#    #status should be 500
#    log to console    ${response.status_code}
#    log to console    ${response.content}


*** Keywords ***
clear data
    clear data
    ${header}    create dictionary    content-type=${content_type}  user-agent=robotframework
    create session  mysession   ${base_url}     verify=true
    ${response}=  post on session    mysession    /calculator/rakeDatabase     headers=${header}


