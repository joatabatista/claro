#language: pt
#utf-8

Funcionalidade: Cadastrar Usuario
Eu como novo usuario do App da Claro
quero realizar meu cadastro

Contexto: Usuario acessa a home do app
Dado que eu estaja na Home do App da Claro Video

@valido
Cenario: Cadastro de Usuario
Quando realizo cadastro
Então valido cadastro com Sucesso

@invalido
Cenario: Cadastro de Usuario Inválido
Quando realizo o cadastro preencho com iformação invalida
Então valido a mensagem de campo invalido