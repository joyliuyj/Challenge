*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}   http://localhost:8080/
${browser}      chrome
${uploadfiletest}       xpath=//*[@id="contents"]/div[1]/div[2]/input
${addfile1}      C:/Users/joyli/Desktop/Challenge/uploadpass.csv
${addfile2}      C:/Users/joyli/Desktop/Challenge/uploadfail1.csv
${addfile3}      C:/Users/joyli/Desktop/Challenge/uploadfail2.csv
${addfile4}      C:/Users/joyli/Desktop/Challenge/uploadfail3.csv

*** Test Cases ***
test for upload csv file
    open browser    ${url}     ${browser}
    maximize browser window
    set selenium speed      1second

    upload file1
    click button    //button[normalize-space()='Refresh Tax Relief Table']
    scroll element into view       //h1[normalize-space()='Total Tax Relieves']
    sleep  2
    clear data
    close browser

#negative test1
#    open browser    ${url}     ${browser}
#    maximize browser window
#    set selenium speed      2seconds
#    upload file2
#    click button    //button[normalize-space()='Refresh Tax Relief Table']
#    element should be visible    //h1[contains(text(),'No records at the moment 😢')]  No records at the moment
#    close browser
#
#negative test2
#    open browser    ${url}     ${browser}
#    maximize browser window
#    set selenium speed      2seconds
#    upload file3
#    click button    //button[normalize-space()='Refresh Tax Relief Table']
#    element should be visible    //h1[contains(text(),'No records at the moment 😢')]  No records at the moment
#    close browser
#
#negative test3
#    open browser    ${url}     ${browser}
#    maximize browser window
#    set selenium speed      2seconds
#    upload file4
#    click button    //button[normalize-space()='Refresh Tax Relief Table']
#    element should be visible    //h1[contains(text(),'No records at the moment 😢')]  No records at the moment
#    close browser

*** Keywords ***
upload file1
    choose file     ${uploadfiletest}    ${addfile1}
upload file2
    choose file     ${uploadfiletest}    ${addfile2}
upload file3
    choose file     ${uploadfiletest}    ${addfile3}
upload file4
    choose file     ${uploadfiletest}    ${addfile4}
clear data
    click link      //a[normalize-space()='Visit Swagger']
    sleep  2
    click element    //span[normalize-space()='calculator-controller']
    click element    //span[contains(text(),'/calculator/rakeDatabase')]
    sleep  2
    click button    //button[normalize-space()='Try it out']
    sleep  2
    click button    //button[normalize-space()='Execute']


