Dado(/^que eu estaja na Home do App da Claro Video$/) do
    page(Home).menu_principal
    page(Home).clicar_campo
    touch("* id:'etCpf'")

end

Quando(/^realizo cadastro$/) do
	page(Home).cadastro_sucesso

end

Então(/^valido cadastro com Sucesso$/) do
	@nome = Faker::Name.first_name
	@sobrenome = Faker::Name.last_name
  @email = Faker::Internet.email
  page(Home).campo_valido(@nome, @sobrenome, @email)
  page(Home).confirmar_cadastro(@nome, @sobrenome)

end

Quando(/^realizo o cadastro preencho com iformação invalida$/) do
  @email = Faker::Internet.email
  @nome = Faker::Name.first_name
  page(Home).cadastro_sucesso
  page(Home).campo_invalido(@email, @nome)
  
end

Então(/^valido a mensagem de campo invalido$/) do
  pending # Write code here that turns the phrase above into concrete actions
end