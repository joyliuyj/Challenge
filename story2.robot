*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}     http://localhost:8080
${content_type}    application/json
${data1}     {"birthday":"19011985","gender":"F","name":"SS1","natid":"S1000012345","salary":"11000","tax":"1100"}
${data2}     {"birthday":"19121958","gender":"F","name":"SS2","natid":"S200001234","salary":"8500","tax":"850"}
${data3}     {"birthday":"29072010","gender":"M","name":"SS3","natid":"S30000123","salary":"7600","tax":"760"}
${data4}     {"birthday":"08-05-1995","gender":"F","name":"SS4","natid":"S4000123","salary":"4300","tax":"430"}
${data5}     {"birthday":"04081939","gender":"Male","name":"SS5","natid":"S610012347","salary":"5000","tax":"500"}
${data6}     {"birthday":"20102004","gender":"F","name":"SS6","natid":"S710012348","salary":"6500","tax":"650"}

*** Test Cases ***
Insert multi records success
    ${header}    create dictionary    content-type=${content_type}  user-agent=robotframework
    create session  mysession   ${base_url}     verify=true

    ${response}=  post on session    mysession    /calculator/insertMultiple  data=[${data1},${data2},${data3}]   headers=${header}
    ${expectedstatuscode}=   set variable   202
    #status should be 202
    open browser        ${base_url}     chrome
    maximize browser window
    sleep  2
    element should be visible   //*[@id="contents"]/div[2]/table/tbody/tr[1]/td[1]    S100$$$$$$$
    element should be visible   //*[@id="contents"]/div[2]/table/tbody/tr[2]/td[1]    S200$$$$$$
    element should be visible   //*[@id="contents"]/div[2]/table/tbody/tr[3]/td[1]    S300$$$$$
    log to console    ${response.status_code}
    Should Be Equal As Numbers   ${response.status_code}   ${expectedstatuscode}
    log to console    ${response.content}
    clear data
    close browser


#Negative test case1
#    ${header}    create dictionary    content-type=${content_type}  user-agent=robotframework
#    create session  mysession   ${base_url}     verify=true
#
#    ${response}=  post on session    mysession    /calculator/insertMultiple  data=[${data4},${data5}]   headers=${header}
#
#     log to console    ${response.status_code}
#
#     log to console    ${response.content}


#Negative test case2
#    ${header}    create dictionary    content-type=${content_type}  user-agent=robotframework
#    create session  mysession   ${base_url}     verify=true
#
#    ${response}=  post on session    mysession    /calculator/insertMultiple  data=[${data5},${data6}]   headers=${header}
#
#    log to console    ${response.status_code}
#
#    log to console    ${response.content}


*** Keywords ***
clear data
     click link      //a[normalize-space()='Visit Swagger']
    sleep  2
    click element    //span[normalize-space()='calculator-controller']
    click element    //span[contains(text(),'/calculator/rakeDatabase')]
    sleep  2
    scroll element into view      //*[@id="operations-calculator-controller-rakeDatabaseUsingPOST"]/div[2]/div/div[3]/div[2]/table/tbody/tr[3]/td[2]/div[1]/div/p
    click button    //button[normalize-space()='Try it out']
    sleep  2
    click button    //button[normalize-space()='Execute']