#bai 1:
 #Viết một keyword máy tính đơn giản có thể thực hiện các phép toán cộng, trừ, nhân và chia.
 #Keyword nhận về 2 số bất kỳ và phép toán
*** Variables ***
${first}  2
${second}  4
${result}
*** Keywords ***
Calculator
    [Arguments]    ${number1}  ${number2}  ${operations}
    IF  ${operations} == "+"
        ${result} =  Evaluate  ${number1}+${number2}
    ELSE IF  ${operations} == "-"
        ${result} =  Evaluate  ${number1}-${number2}
    ELSE IF  ${operations} == "*"
        ${result} =  Evaluate  ${number1}*${number2}
    ELSE IF  ${operations} == "/"
        ${result} =  Evaluate  ${number1}/${number2}
    ELSE
        log  wrong operation
        RETURN
    Log    ${result}
    END
            
*** Test Cases ***
Bai 1
    [Template]    Calculator
    1  2  "-"
    5  0  "+"
    1  5  "*"
    4  2  "/"

