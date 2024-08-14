*** Settings ***
Library    SSHLibrary
Library    BuiltIn

*** Variables ***
${host}    172.20.107.91
${username}    root
${passwd}    SIOS1234765

*** Keywords ***
Connect SSH
    Open Connection    ${host}
    Login    ${username}    ${passwd}
    ${stdout} =    Execute Command    ls /
    Log    ${stdout}

*** Test Cases ***

Test case 2
    Connect SSH
    ${stdout} =     Execute Command    cd /root && ls -a
    Should Contain    ${stdout}    lifekeeper.log
    ${stdout} =    Execute Command   cat lifekeeper.log
    Should Contain    ${stdout}    Line 1