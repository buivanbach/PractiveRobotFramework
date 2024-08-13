
*** Keywords ***
IsPrimeNumber 
    [Arguments]    ${number}
    ${result}=  Set Variable    ${True}
    FOR  ${i}  IN RANGE    2    ${number} / 2   1
        ${i}    Convert To Integer  ${i}

        IF    ${number} % ${i} == 0
            ${result} =  Set Variable    ${False}
            BREAK
        END
    END
    Log    ${result}

*** Test Cases ***
Bai2
    [Template]    IsPrimeNumber
    3
    6
    7
    13
    21