*** Settings ***
Library    DateTime
*** Keywords ***
GetListEvenNumber
    ${curDate} =  Get Current Date
    ${day} =    Convert Date    ${curDate}    %d
    ${day} =     Convert To Integer    ${day}
    ${month} =    Convert Date    ${curDate}    %m
    ${month} =     Convert To Integer    ${month}
    ${total} =    Set Variable    0
    ${n} =  Evaluate    ${day} * ${month}
    FOR     ${i}     IN RANGE    1    ${n}    1
        ${i}    Convert To Integer    ${i}
        IF    ${i} % 2 == 0
            ${total} =    Evaluate    ${total} + ${i}
        END
    END
    log    ${total}
*** Test Cases ***
Bai3
    GetListEvenNumber