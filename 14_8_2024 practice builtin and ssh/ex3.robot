*** Settings ***
Library    SSHLibrary
Library    BuiltIn
Library    DateTime
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

Test case 3
    Connect SSH
    ${stdout}    Execute Command    cd /var && ls -a
    Log    ${stdout}
    ${year} =     Get Time   year    NOW
    ${year}    Convert To Integer    ${year}
    ${temp}    Set Variable    ${Empty}
    FOR    ${i}    IN RANGE    2    ${year}
        Execute Command    echo ${i} >> lifekeeper.log
    END

    ${stdout}    Execute Command    cat lifekeeper.log
    Log    ${stdout}