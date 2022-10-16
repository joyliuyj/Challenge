# Challenge
1. Story1 is to add a single record via API, hardcord data and go to app to check the record is added successfully, staus code is 202, then clear data.
2. Story2 is to add multiple records via API, also hardcord and check the records are added successfully and status code is 202, then clear data.
3. For story1 and story2 have write negative test cases but not sure how to handle it e.g if give 11-11-2000 as birthday then will get Failed result, but the expected result is failed.
4. Story3 is to test can upload csv file from app UI, and then click Refresh Tax Relief Table button to check the records are added, then clear data.
5. Story4 is to check the display of natid and amount calculation after upload csv file, I found that missing variable between 75 and 76, and when age =18.01 then will use age <=18's variable to calculate, which is different as my Expected Result Calculation in Excel.
6. As a beginner I have no idea how to not hard code for the mulitple data, will learn it more.
7. Some times will get error e.g "locator xxx not found", need to double check the locator, I've added Extensions SelectorsHub and it helped much, if keep gettsing same error then I will change the "click button/link" to "click element", sometimes if add sleep also can get correct locator.

