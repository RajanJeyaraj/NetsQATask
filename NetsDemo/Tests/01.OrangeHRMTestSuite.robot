*** Settings ***
Resource    ../EnvironmentVariables/env_variables.resource
Resource    ../Resources/ExcelDataRead.resource
Resource    ../Resources/Login&LogoutPageKeywords.resource
Resource    ../Resources/HomePageKeywords.resource

Test Setup    Open given Excel file    ${sFileName} 
 


*** Test Cases ***    
TC_001_Verify_Login_Invalid_Credentials_message
    Open My Browser    ${url}
    ${invalidusername}    Get data from Excel with given column    Sheet1    TC_001_Verify_Login_Invalid_Credentials_message    username
    Enter UserName    ${invalidusername}
    ${invalidpassword}    Get data from Excel with given column    Sheet1    TC_001_Verify_Login_Invalid_Credentials_message    password
    Enter Password    ${invalidpassword}
    Click SignIn    
    Apply Wait  
    Verify Failure login
    Close my browser 
    
 
TC_002_Verify_Login_Valid_Credentials_message
    Open My Browser    ${url}
    ${validusername}    ${validpassword}    Get credentials from screen
    Enter UserName    ${validusername}
    Enter Password    ${validpassword}
    Click SignIn
    Apply Wait
    ${temp}    Verify Successful Login
    Print the name    ${temp}    
    Close my browser
    
TC_003_Verify_InvalidLogin_CaptureScreenshot
    Open My Browser    ${url}
    ${invalidusername}    Get data from Excel with given column    Sheet1    TC_001_Verify_Login_Invalid_Credentials_message    username
    Enter UserName    ${invalidusername}
    ${invalidpassword}    Get data from Excel with given column    Sheet1    TC_001_Verify_Login_Invalid_Credentials_message    password
    Enter Password    ${invalidpassword}
    Click NSignIn    
    Apply Wait  
    Close my browser 
    
          
   
        
    
         
        
    
    
    


   
    
    

