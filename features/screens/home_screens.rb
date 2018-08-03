class Home < Calabash::ABase

	#ACESSA ABA DO MENU
	def menu_principal
		page(Geral).validar_elemento('action_bar')
		touch("android.widget.ImageButton")
		
	end

	#CLICA NO MENU
	def clicar_campo
		sleep 5
		page(Geral).validar_elemento('menu_item')
		touch("* text:'Cadastre-se'")
		
	end
		#CADASTRAR CPF
	def cadastro_sucesso
		keyboard_enter_text(Faker::CPF.number)
		touch("* id:'btContinue'")
	end	

		#PREENCHE CAMPO VALIDO (CHAMA TODOS OS METODOS ABAIXO)
	def campo_valido(nome, sobrenome, email)
		self.preencher_email(email)
		self.preencher_email_repetir(email)
		self.preencher_senha(ENV['SENHA'])
		self.preencher_senha_repetir(ENV['SENHA'])
		self.preencher_nome(nome)
		self.preencher_sobrenome(sobrenome)
		self.cofirmar_dados
		self.btn_continua
		sleep 5	
	end

	#PREENCHER CAMPO INVALIDO (CHAMA TODOS OS METODOS ABAIXO)
	def campo_invalido(email,nome)
		self.preencher_email(email)
		self.preencher_email_repetir(email)
		self.preencher_senha(ENV['SENHA'])
		self.preencher_senha_repetir(ENV['SENHA'])
		self.preencher_nome(nome)
		self.btn_continua
	end	

		#EMAIL
	def preencher_email(email)
		touch("* id:'edit_email'")
		keyboard_enter_text(email)
	end	

		#CONFIRMA_EMAIL
	def preencher_email_repetir(email)
		touch("* id:'edit_email_repeat'")
		keyboard_enter_text(email)
	end	

		#SENHA
	def preencher_senha(senha)
		touch("* id:'edit_password'")
		keyboard_enter_text ENV['SENHA']#ENV EU COLOCO A SENHA NA HORA DE EXECUTA O CODIGO EX:LINHA DE COMANDO E SENHA=123456 
	end	

		#CONFIRMA_SENHA
	def	preencher_senha_repetir(senha)
		touch("* id:'edit_password_repeat'")
		keyboard_enter_text ENV['SENHA']#ENV EU COLOCO A SENHA NA HORA DE EXECUTA O CODIGO EX:LINHA DE COMANDO E SENHA=123456
		hide_soft_keyboard
	end

		#NOME
	def preencher_nome(nome)
		touch("* id:'edit_name'")
		keyboard_enter_text(nome)		
	end

		#SOBRENOME
	def preencher_sobrenome(sobrenome)
		hide_soft_keyboard
		touch("* id:'edit_surname'")
		keyboard_enter_text(sobrenome)		
	end

		#CHECKBOX
	def cofirmar_dados
		hide_soft_keyboard
		touch("* id:'checkbox_terms'")

		#BOTÃO_CONTINUA
	def	btn_continua
		hide_soft_keyboard
		touch("* id:'btn_continue'")
				
	end

	#ACESSA O MENU LISTA
	def validacao
		return query("* id:'menu_item'", :text).first
	end

		#ACESSA O MENU DE VOLTA E FAZ CONFIRMAÇÃO DO CAMPO COM NOME E SOBRENOME DO USUARIO
	def confirmar_cadastro(nome, sobrenome)
		page(Geral).validar_elemento_class('android.widget.ImageButton')
		touch("android.widget.ImageButton")
		sleep 5
		page(Geral).validar_elemento_class('android.widget.ImageButton')
		touch("android.widget.ImageButton")
		sleep 5
		page(Geral).validar_elemento('menu_item')
		touch("android.widget.ImageButton")
		expect(page(Home).validacao).to include nome

		puts "Campo Validado #{nome} #{sobrenome} com SUCESSO"
	end
end	

end

#968280530 