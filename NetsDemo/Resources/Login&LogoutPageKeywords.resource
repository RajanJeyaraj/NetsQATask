*** Settings ***
Library    SeleniumLibrary   
Library    String                   
Variables    ../PageObjects/locators.py

Resource    ../EnvironmentVariables/env_variables.resource

*** Keywords ***
Open My Browser
    [Arguments]    ${appUrl}
   # Open Browser    ${appUrl}    ${appBrowser}
    #Create Webdriver    Chrome    executable_path=C:/Python38/Scripts/chromedriver.exe
    Create Webdriver    Chrome    executable_path=${executable_path}
    Go To    ${appUrl}
    Set Browser Implicit Wait    2
    Maximize Browser Window
    
Enter UserName
    [Arguments]    ${userName}
    Input Text    ${txt_loginUserName}    ${userName}
    
Enter Password
    [Arguments]    ${password}  
    Input Text    ${txt_loginPassword}    ${password}
    
Click SignIn
    Click Button    ${btn_submitBtn}   
    
Click NSignIn
    Run Keyword And Continue On Failure    Click Button    ${btn_negsubmitBtn}  
    
Get credentials from screen
    ${temp}=    Get Text    ${get_credentials}
    @{words} =	Split String	${temp}
    Log To Console    Username is ${words}[3] 
    Log To Console    Password is ${words}[7]
    
    [Return]    ${words}[3]    ${words}[7]        
    
   
Verify Successful Login
    #Title Should Be    
    ${temp}    Run Keyword And Continue On Failure    Get Text    ${link_welcomeadmin}
    #Run Keyword If    "${temp}"=='Welcome Paul'    Log Title
    Run Keyword If    "${temp}"=="${successmsg}"    Log To Console    User is logged in Successfully    ELSE    Log To Console    User is not logged in Successfully       
    #Run Keyword If    "${temp}"=='Welcome Paul'    Log To Console    User is logged in Successfully    ELSE    Log To Console    User is not logged in Successfully
    [Return]    ${temp}        
 
Verify Failure login
    ${temp}    Get Text    ${msg_warning} 
    #Run Keyword If    "${temp}"=='Invalid credentials'    Log Title 
    Log To Console    Display warning Text is ${temp}    
    #Run Keyword If    "${temp}"=='Invalid credentials'    Log To Console    Display Text is Correct    ELSE    Log To Console    Display Text is not Correct
    Run Keyword If    "${temp}"=="${warningtext}"    Log To Console    Display Text is Correct    ELSE    Log To Console    Display Text is not Correct     

Print the name
    [Arguments]    ${temp}
    @{words} =	Run Keyword And Continue On Failure    Split String	${temp}
    Run Keyword And Continue On Failure    Log To Console    Logged in username is @{words}[1]
        


Verify Successful LogOut
    Title Should Be    OrangeHRM
    Log Title
    
Apply Wait
    Sleep    2
          
Close my browser
    Run Keyword And Continue On Failure    Close Browser
    


      
    
      