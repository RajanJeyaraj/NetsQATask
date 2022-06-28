*** Settings ***
Library    SeleniumLibrary          
Variables    ../PageObjects/locators.py

*** Keywords ***
Click WelcomeAdmin
    Click Link    ${link_WelcomeAdmin}
    
Display details About PopUp
        ${temp}    Get Text    ${popup_data}
        Log To Console    ${temp}    
        
Press Escape Key
    Press Keys    ${popup_data}    ESC   
    

Verify Company details in PopUp
     ${temp}    Get Text    ${popup_data_companyname}
     Run Keyword If    "${temp}"=="Company Name: OrangeHRM (Pvt) Ltd"    Log    Company name is correct    
       
  
       
          
    
