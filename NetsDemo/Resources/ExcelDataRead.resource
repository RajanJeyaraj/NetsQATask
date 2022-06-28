*** Settings ***
Library    ExcelRobot  
Library    openpyxl           
Library    OperatingSystem  
Library    robot.api.logger  
Resource    ../Resources/Login&LogoutPageKeywords.resource       

*** Variables ***
${colNum}  
 
*** Keywords ***
Open given Excel file
    [Arguments]    ${sFileName}
    #Check that the given Excel Exists
    ${inputfileStatus}    ${msg}    Run Keyword And Ignore Error    OperatingSystem.File Should Exist    ${sFileName}
    Run Keyword If    "${inputfileStatus}"=="PASS"    info    ${sFileName} Test data file exist    ELSE    Fail    Cannot locate the given Excel file.
    Open Excel    ${sFileName}
    
Get data from Excel with given column
    [Arguments]    ${sSheetName}    ${sTestCaseNo}    ${sColumnName}
    log    ${sColumnName}  #username
    ${colCount}    Get Column Count    ${sSheetName}
    FOR    ${y}    IN RANGE    0    ${colCount}
        \    ${header}    Read Cell Data    ${sSheetName}    ${y}    0
        #Check if this is the given header
        \    Run Keyword If    "${header}"=="${sColumnName}"    Exit For Loop    
             Set Test Variable    ${colNum}    ${y}            
             Log To Console    ${colNum}        
  
    #Get the total rows in the Sheet
    ${iTotalRows}    Get Row Count    ${sSheetName}
    FOR    ${iRowNo}    IN RANGE    1    ${iTotalRows}
    \    ${TC_Num}    Read Cell Data    ${sSheetName}    0    ${iRowNo}
        #Incase TestCase No is same , fetch the data from same row and given column No
    \    ${sSearchedData}    Run Keyword If    "${sTestCaseNo}"=="${TC_Num}"    Read Cell Data    ${sSheetName}    ${colNum}
        ...    ${iRowNo}
    \    Run Keyword If    "${sTestCaseNo}"=="${TC_Num}"    Exit For Loop
    [Return]    ${sSearchedData}
    
       
   

    
 