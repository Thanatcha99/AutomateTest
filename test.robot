*** Settings ***
Library     Selenium2Library
Documentation     A test suite for valid login.
...
...               Keywords are imported from the resource file
Resource          keywords.resource
Default Tags      positive

*** Test Cases ***
Verify_Add_To_Completed
    #Step Open Browser
    Open Browser                        https://abhigyank.github.io/To-Do-List/         gc
    Wait Until Page Contains            To Do List                                      5s
    #Step Add List 1
    Wait Until Element Is Visible       //*[@id="new-task"]                             5s
    Input Text                          //*[@id="new-task"]                             Test1
    Capture Page Screenshot             addList.png
    Wait Until Element Is Visible       //*[@href="#add-item"]                          5s
    Click Element                       //*[@id="add-item"]/button/i
    #Step Check List
    Wait Until Element Is Visible       //*[@href="#todo"]                              5s
    Click Element                       //*[@href="#todo"]                              
    Wait Until Page Contains            Test1                                           5s
    Capture Page Screenshot             checkList.png
    #Step Completed List
    Wait Until Element Is Visible       //*[@id="incomplete-tasks"]/li/label            5s
    Click Element                       //*[@id="incomplete-tasks"]/li/label
    Wait Until Element Is Visible       //*[@href="#completed"]                         5s
    Click Element                       //*[@href="#completed"]
    Wait Until Page Contains            Test1                                           5s
    Capture Page Screenshot             ListCompleted.png
    Close All Browsers


Verify_Add_To_Deleted
    #Step Open Browser
    Open Browser                        https://abhigyank.github.io/To-Do-List/         gc
    Wait Until Page Contains            To Do List                                      5s
    #Step Add List 1
    Wait Until Element Is Visible       //*[@id="new-task"]                             5s
    Input Text                          //*[@id="new-task"]                             Test2
    Capture Page Screenshot             addList.png
    Wait Until Element Is Visible       //*[@href="#add-item"]                          5s
    Click Element                       //*[@id="add-item"]/button/i
    #Step Check List
    Wait Until Element Is Visible       //*[@href="#todo"]                              5s
    Click Element                       //*[@href="#todo"]                              
    Wait Until Page Contains            Test2                                           5s
    Capture Page Screenshot             checkList.png
    #Step Delete List
    Wait Until Element Is Visible       //*[@class="mdl-button mdl-js-button mdl-js-ripple-effect delete"]                5s
    Click Element                       //*[@class="mdl-button mdl-js-button mdl-js-ripple-effect delete"]
    Wait Until Element Is Visible       //*[@href="#completed"]                         5s
    Click Element                       //*[@href="#completed"]
    Wait Until Page Does Not Contain            Test2                                           5s
    Capture Page Screenshot             ListDeleted.png
    Close All Browsers