# Installation:                                                                   
Windows                                                                         
Python version:  3.10.7                                                               
PyCharm                                                            
pip                                                              

# Execute below cmd commands                                                            
pip install selenium                                                                              
pip install robotframework                                                             
pip install robotframework-requests                                                    
pip install robotframework-jsonlibrary                                                              
pip install robotframework-datadriver                                                                                                             
pip install robotframework-seleniumlibrary                                                            


# Execute below commands to run automation test cases                                                                                        
java -jar {path-to-this-jar}/OppenheimerProjectDev.jar                                                  
robot {testcase-folder}\testcase file name

# Put chromedriver.exe in Python\Scripts folder                                                                  

# Test scenarios and some thought
1. Story1 is to add a single record via API, hardcord data and go to app to check the record is added successfully, staus code is 202, then clear data.
2. Story2 is to add multiple records via API, also hardcord and check the records are added successfully and status code is 202, then clear data.
3. For story1 and story2 have write negative test cases but not sure how to handle it e.g if give 11-11-2000 as birthday then will get Failed result, but the expected result is failed.
4. Story3 is to test can upload csv file from app UI, and then click "Refresh Tax Relief Table" button to check the records are added, then clear data.
5. Story4 is to check the display of natid and amount calculation after upload csv file, I using Excel to do the calculation for the tax relief and compare the result in robot framework, I found that missing variable for 75<age<76. When age =18.01 then will use age <=18's variable to calculate, it's rounding off which it's incorrect.
6. Story5 is to check the background color and text for the button "Dispense Now", after click the button will prompt new page with "Cash dispensed"
7. Some times will get error e.g "locator xxx not found", need to double check the locator, I've added Extensions SelectorsHub and it helped much, if keep gettsing same error then I will change the "click button/link" to "click element", sometimes if add sleep also can get correct locator.
8. As a robot framework beginner I have no idea how to generate random test data, and how to handle the complicated calculation, so I hard code my test data, will learn it more.

# Test scenarios:
1.Postive:1) API method is POST, path is correct  2)naid,name,salary,gender,birthday and tax are not empty, all set and valid  3)upload file is csv, file header is not empty, all set and valid 
2.Negative:1) API method is GET/PUT/DELETE, path is incorrect 2) All fields are empty or not set 3) one of the field is empty or not set 4) length checking e.g gender should be 1 character, birthday 1122, naid <=4 characters 5) invalid type e.g birthday/salary/tax give aaaa 6) invalid birthday format e.g 12-11-2010,12/11/2010,23232020,01012030 7)invalid gender e.g except F&M  8)naid 9) file type is not csv, file header not set or incorrect, file got empty row
3.Doubt: 1)unique checking: if the first 4 characters of naid are the same, name is same, how to differentiate 2)decimal checking: "AC4: After calculating the tax relief amount, it should be subjected to normal rounding rule to remove any decimal places" = no decimal for the tax relief?  "AC6: If the calculated tax relief amount before applying the normal rounding rule gives a value with more than 2 decimal places, it should be truncated at the second decimal place and then subjected to normal rounding rule"=keep 1 decimal? 
