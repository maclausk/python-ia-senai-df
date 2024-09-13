from flask import Flask 

app = Flask(__name__)

@app.route('/')
def index():
    return "Estilo Rei Barbearia"

@app.route('/novofuncionario')
def adicionar_funcionario():
    return "Novo Funcionario"

@app.route('/novocliente')
def adicionar_cliente():  
    return "Novo Cliente" 

@app.route('/novoservico')
def adicionar_servico():  
    return "Novo Serviço "

@app.route('/novoagendamento')
def novo_agendamento():  
    return "Novo Agendamento "

@app.route('/login')
def login():
    return "Login Efetuado"
@app.route('/logout')
def logout():
    return "Logout Efetuado"


app.run(debug=True)