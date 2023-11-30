*** Settings ***
Library     AppiumLibrary
Resource    credentials.robot

*** Variables ***
#*** Test Variables ***
&{USER1-DETAILS}            email=${EMAIL_1}     password=${PASSWORD}
&{USER2-DETAILS}            email=${EMAIL_2}     password=${PASSWORD}

#*** Application variable ***
#in case I want to change these variables later on for some reason,
#it is easy to change all of them at once!
${CHAT21-APPLICATION-ID}            chat21.android.demo
${CHAT21-APPLICATION-ACTIVITY}      chat21.android.demo.SplashActivity

#*** Login Page ***
${LOGIN-EMAIL-FIELD}        id=${CHAT21-APPLICATION-ID}:id/email
${LOGIN-PASSWORD-FIELD}     id=${CHAT21-APPLICATION-ID}:id/password
${LOGIN-SIGNIN-BUTTON}      id=${CHAT21-APPLICATION-ID}:id/login

#*** Main Page ***
#to find text from the tab
${MAIN-HOME-TAB}                //android.widget.TextView[@text="Home"]
${MAIN-PROFILE-TAB}             //android.widget.TextView[@text="Profile"]

#*** Profile Page ***
${PROFILE-LOGOUT-BUTTON}        id=chat21.android.demo:id/logout

*** Keywords ***

Open Chat21 Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=E9ATBC011620    appPackage=${CHAT21-APPLICATION-ID}      appActivity=${CHAT21-APPLICATION-ACTIVITY}     automationName=Uiautomator2
Sign In With User
    [Arguments]    ${EMAIL}     ${USERPASSWORD}
    Input User Email            ${EMAIL}
    Input User Password         ${USERPASSWORD}
    Submit Login
    Verify Login Is Successful

Input User Email
    [Arguments]    ${EMAIL}
    Verify Login Email Field Is Displayed
    Input Text          ${LOGIN-EMAIL-FIELD}        ${EMAIL}

Input User Password
    [Arguments]     ${USERPASSWORD}
    Input Text          ${LOGIN-PASSWORD-FIELD}     ${USERPASSWORD}

Submit Login
    Click Element       ${LOGIN-SIGNIN-BUTTON}

Verify Login Is Successful
    Wait Until Page Contains Element    ${MAIN-HOME-TAB}

Logout With user
    Go To Profile Page
    Click The Logout Button
    Verify Login Email Field Is Displayed

Go To Profile Page
    Click Element       ${MAIN-PROFILE-TAB}
    Wait Until Page Contains Element                ${PROFILE-LOGOUT-BUTTON}

Click The Logout Button
    Click Element       ${PROFILE-LOGOUT-BUTTON}

Verify Login Email Field Is Displayed
    Wait Until Page Contains Element                ${LOGIN-EMAIL-FIELD}