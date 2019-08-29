*** Settings ***
Library   SeleniumLibrary        

Suite Setup       Log    I am inside Test Suite SetUp    
Suite Teardown    Log    I am inside Test Suite Teardown    
Test Setup        Log    I amd inside Test SetUp    
Test Teardown     Log    I am inside Test Teardown    

Default Tags    Sanity 


*** Test Cases ***
MyFirstTest
    [Tags]     Smoke
    Log    Hello Word...  
    
FirstSeleniumTest
   Open Browser    https://google.co.in    chrome
   Set Browser Implicit Wait    5
   Input Text      name=q                  Robot Framework
   Press Keys      name=q       ENTER
   # Click Button    name=btnK     
   Sleep    5    
   Close Browser
   Log    Test Completed    

SampleTestCase
     [Tags]     Smoke
  Open Browser    https://engel:20rufer19@devrelaunch.engelsrufer.de/customer/account/login/                   chrome 
  Set Browser Implicit Wait    5 
  Click Button            id=btn-cookie-allow 
  Close Browser    


EngelsruferLoginTest 
    Set Tags    Regression 
    Remove Tags    Regression 
    [Documentation]         Login in Engelsrufer website 
    Open Browser            https://engel:20rufer19@testrelaunch.engelsrufer.world/customer/account/login/      chrome 
    Set Browser Implicit Wait    5 
    Click Button            id=btn-cookie-allow   
    Input Text              id=email                                  manish@pixelmechanics.de
    Input Password          id=pass                                   test@1234
    Sleep                        5      
    Click Element           xpath=//*[@id="login-form"]/fieldset/div[4]/div[1]/label                     
    Click Button            id=send2    
    Close Browser
    Log                     Login test Completed  
    
    
EngelsruferloginTestWithvariables
     [Tags]     Smoke
    [Documentation]         Login in Engelsrufer website with variables 
    Open Browser            ${URL}                                               chrome
    Set Browser Implicit Wait    5 
    Click Button            id=btn-cookie-allow    
    Input Text              id=email                                  @{CREDENTIALS}[0]  
    Input Password          id=pass                                   &{LOGINDATA}[Password]
    Sleep                        5
    Click Element           xpath=//*[@id="login-form"]/fieldset/div[4]/div[1]/label        
    Click Button            id=send2    
    Close Browser
    Log                     Login test completed with variables  
    Log                     This test was executed by %{username} on %{os}       
    
        
   
      
*** Variables ***
${URL}                      https://engel:20rufer19@testrelaunch.engelsrufer.world/customer/account/login/

@{CREDENTIALS}              manish@pixelmechanics.de        test@1234

&{LOGINDATA}                E-Mail=manish@pixelmechanics.de          Password=test@1234




*** Test Cases ***
EngelsruferLoginTestWithKeywords
    [Documentation]        Login in Engelsrufer website with Keywords
    Open Browser           ${URL}                                               chrome
    LoginKW 
    LoginKW1 
    Click Button           id=send2     
    Close Browser
    Log                    login test completed with Keywords     



*** Keywords ***
LoginKW
    Set Browser Implicit Wait    5
    Click Button            id=btn-cookie-allow  
    Input Text              id=email                                  @{CREDENTIALS}[0]  
    Input Password          id=pass                                   &{LOGINDATA}[Password]
    
LoginKW1 
    Sleep                        5    
    Click Element          xpath=//*[@id="login-form"]/fieldset/div[4]/div[1]/label    

NewTestForGitUpdateCheck
    Log    I am inside in New Git Update test    
    
   
