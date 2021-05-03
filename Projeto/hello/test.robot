*** Settings ***
Library     app.py


*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=          Welcome     Udson
    Should Be Equal     ${result}   Olá Udson, Bem vindo ao curso básico de robot framework
