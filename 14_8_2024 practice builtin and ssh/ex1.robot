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
Test case 1
    Connect SSH
    ${stdout} =    Execute Command    echo 'Line 1' > /root/lifekeeper.log
    log    ${stdout}
    Execute Command     cd /root &&  ls -a
    ${stdout} =    Execute Command   cat lifekeeper.log

    log    ${stdout}
