*** Settings ***
Library    AppiumLibrary
Resource    ../Resources/android-res.robot

*** Test Cases ***
Login
    Open Chat21 Application
    Sign In With User    ${USER1-DETAILS}[email]    ${USER1-DETAILS}[password]
    Logout With User
    Sign In With User    ${USER2-DETAILS}[email]    ${USER2-DETAILS}[password]
    #Logout With User

    #What do I want to do?
        #How do I do it?

    #Open Chat21 Application
    #Sign In With User
        #Input User Email
        #Input User Password
        #Submit Login
        #Verify Login Is Successful
    #Logout With user
        #Go To Profile Page
        #Click The Logout Button
        #Verify Logout Is Succesful
