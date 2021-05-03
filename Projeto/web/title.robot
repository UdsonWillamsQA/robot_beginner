*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Deve validar o titulo
    Open Browser        https://training-wheels-protocol.herokuapp.com/    firefox
    Title Should Be     Training Wheels Protocol
    Close Browser