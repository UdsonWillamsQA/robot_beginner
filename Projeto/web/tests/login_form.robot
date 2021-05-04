*** Settings ***
Resource            base.robot

Test Setup          Nova sessão  
Test Teardown       Encerra sessão

*** Test Cases ***
Login com sucesso
    Go To                       ${url}/login
    Login With      stark       jarvis!
    Page Should Contain         Tony Stark

Senha invalida
    [tags]          login_error
    Go To           ${url}/login
    Login With      stark           123
    
    Should Contain Login Alert      Senha é invalida! 

Usuario não existe
    [tags]          login_user404
    Go To           ${url}/login
    Login With      papituu       123654
    
    Should Contain Login Alert      O usuário informado não está cadastrado!

*** Keywords ***
Login With
    [Arguments]     ${uname}    ${pass}

    Input Text      css:input[name=username]        ${uname}
    Input Text      css:input[name=password]        ${pass}
    Click Element   class:btn-login 

Should Contain Login Alert
    [Arguments]         ${expected_message}

    ${message}=         Get WebElement        id:flash
    Should Contain      ${message.text}       ${expected_message}

Should See Login User
    [Arguments]         ${user_name}

    Page Should Contain     Olá, ${user_name}. Você acessou a área logada!