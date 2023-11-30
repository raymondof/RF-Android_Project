*** Settings ***
Library    AppiumLibrary

*** Variables ***
#different ways to press login button in chat21
#the difference with these different ways comes to the time that it takes to find them when testing
#there are also differences in Android and ios
${LOGIN-SUBMIT-BUTTON1}     id=chat21.android.demo:id/login
${LOGIN-SUBMIT-BUTTON2}     //android.widget.Button[@text="Login"]
${LOGIN-SUBMIT-BUTTON3}     //android.widget.Button[contains(@text,"Login")]
${LOGIN-SUBMIT-BUTTON4}     //android.widget.Button[contains(@resource-id,'login')]
${LOGIN-SUBMIT-BUTTON5}     //android.widget.Button[@resource-id='chat21.android.demo:id/login']
${LOGIN-SUBMIT-BUTTON6}     //android.widget.Button[@resource-id='chat21.android.demo:id/login' and @text="Login"]
${LOGIN-SUBMIT-BUTTON7}     //android.widget.LinearLayout//android.widget.Button[@text="Login"]

*** Test Cases ***
Open_Application
    #Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5556    appPackage=sdk.chat.live    appActivity=sdk.chat.demo.activities.WelcomeActivity    automationName=Uiautomator2
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=E9ATBC011620    appPackage=chat21.android.demo      appActivity=chat21.android.demo.SplashActivity    automationName=Uiautomator2
    Wait Until Page Contains Element    ${LOGIN-SUBMIT-BUTTON1}
    Wait Until Page Contains Element    ${LOGIN-SUBMIT-BUTTON2}
    Wait Until Page Contains Element    ${LOGIN-SUBMIT-BUTTON3}
    Wait Until Page Contains Element    ${LOGIN-SUBMIT-BUTTON4}
    Wait Until Page Contains Element    ${LOGIN-SUBMIT-BUTTON5}
    Wait Until Page Contains Element    ${LOGIN-SUBMIT-BUTTON6}
    Wait Until Page Contains Element    ${LOGIN-SUBMIT-BUTTON7}