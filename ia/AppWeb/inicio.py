"""
Este arquivo contém o código para iniciar o aplicativo Flask e definir suas rotas. Ele inclui funcionalidades como:
- Conversão de texto em áudio utilizando a biblioteca gTTS.
- Páginas como /senia (onde a conversão de texto em fala ocorre), / (página inicial), e /login (para autenticação).

Há verificação de login, onde o usuário "joao" e senha "123" são os credenciais corretos para acessar a página /senia.
"""
# Importamos a biblioteca gTTS (Google Text-to-Speech) que converte texto em fala.
from gtts import gTTS

# Importamos o Flask e suas funções. Flask é um framework web em Python.
# render_template: Renderiza um template HTML.
# request: Manipula as requisições HTTP (como pegar dados de um formulário).
import os
from flask import Flask, render_template, request

# Criamos uma instância do aplicativo Flask. Essa linha inicializa a aplicação web.
app = Flask(__name__)  # cria aplicativo Flask

# Definimos uma rota para o caminho /senia. 
# O método GET exibe a página. O POST recebe dados do formulário.
@app.route('/senia', methods=['GET', 'POST'])
def abrir_assistente():
    # Inicializa a variável 'audio_path' como None. 
    # Ela vai armazenar o caminho do arquivo de áudio gerado.
    audio_path = None

    # Verifica se o método da requisição é POST (quando o usuário submete o formulário).
    if request.method == 'POST':
        # Pega o texto inserido no campo de texto do formulário HTML usando o nome 'texto'.
        texto = request.form['texto']

        # Define o idioma da fala como português do Brasil (pt-br).
        lingua = 'pt-br'

        # Cria um objeto gTTS com o texto e o idioma especificado.
        tts = gTTS(text=texto, lang=lingua)

        # Define o caminho onde o arquivo de áudio será salvo.
        audio_path = 'static/audio_exemplo.mp3'

        # Salva o arquivo de áudio no caminho especificado.
        tts.save(audio_path)

    # Renderiza a página 'senia.html' e passa o caminho do áudio para ser usado na página.
    return render_template('senia.html', audio=audio_path)

# Definimos a rota para a página principal (/), que carrega o arquivo 'index.html'.
@app.route('/')
def index():
    return render_template('index.html')

# Definimos a rota para a página de login (/login), que carrega o arquivo 'login.html'.
# GET exibe o formulário, POST enviaria dados (aqui não está sendo usado POST para dados de login).
@app.route('/login', methods=['GET', 'POST'])
def logar():
    return render_template('login.html')

# Definimos a rota para autenticação (/autenticar). Ela verifica as credenciais do usuário.
@app.route('/autenticar', methods=['GET', 'POST'])
def autentificar():
    # Verifica se o método da requisição é POST (usuário submeteu o formulário).
    if request.method == 'POST':
        # Verifica se o usuário e a senha estão corretos (usuário: 'joao', senha: '123').
        if request.form['senha'] == '123' and request.form['usuario'] == 'joao':
            # Se as credenciais estiverem corretas, redireciona para a página 'senia.html'.
            return render_template('senia.html')
        else:
            # Se as credenciais estiverem incorretas, exibe uma mensagem de erro na página de login.
            msg = 'Erro de autentificação'
            return render_template('login.html', msg=msg)

# Essa linha garante que o app será executado se o script for executado diretamente.
# O modo debug=True permite que o Flask atualize a página automaticamente quando o código for alterado.
if __name__ == '__main__':
    app.run(debug=True)

"""
Explicação Geral:
Bibliotecas Importadas:

gTTS: Converte texto em áudio.
Flask: Framework para criar a aplicação web.
render_template: Função do Flask para renderizar templates HTML.
request: Utilizado para manipular dados enviados pelo formulário HTML.
Função abrir_assistente:

Essa função trata tanto o método GET (quando a página é carregada) quanto o método POST (quando o formulário de texto é submetido).
Converte o texto inserido em um campo de texto HTML em um arquivo de áudio MP3.
Função index:

Carrega a página inicial.
Função logar:

Carrega a página de login.
Função autentificar:

Verifica as credenciais inseridas na página de login. Se o usuário for "joao" e a senha for "123", o login é aceito e a página "senia.html" é carregada. Caso contrário, exibe uma mensagem de erro.
Iniciando o App:

Se o arquivo for executado diretamente, o aplicativo Flask é iniciado com a opção debug=True, permitindo que o servidor seja atualizado automaticamente a cada modificação no código.
Comentário Final:
O código usa o Flask para criar uma aplicação web simples, onde o usuário pode converter texto em fala e acessar funcionalidades após realizar o login.
"""