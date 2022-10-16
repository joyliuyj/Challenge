*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  http://localhost:8080/
${browser}      chrome

*** Test Cases ***
Test the button
    open browser  ${url}    ${browser}
    maximize browser window
    scroll element into view  //a[normalize-space()='Dispense Now']
    ${elem}    Get Webelement    //a[normalize-space()='Dispense Now']
    ${bg color}    Call Method    ${elem}    value_of_css_property    background-color
    #convert to string   ${bg color}
    log to console     ${bg color}
    sleep  2
    click element   //a[normalize-space()='Dispense Now']
    sleep   2
    element should be visible   //div[@class='display-4 font-weight-bold']  Cash dispensed
    sleep   1
    close browser
