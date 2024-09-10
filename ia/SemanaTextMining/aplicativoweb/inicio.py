# biblioteca de texto e voz do google
from gtts import gTTS
# Biblioteca flask
from flask import Flask,render_template,request
import os

# criar o objeto flask
app = Flask(__name__)

# / - página principal
# POST - inserir
# GET - recuperar
@app.route('/',methods=['GET','POST'])
def index():
    audio_path = None
    if request.method == 'POST':
        # pegar valor do html <textfield>
        texto = request.form['texto']

        # configurar o idioma
        lingua = 'pt-br'

        # criaçaõ do objeto
        tts = gTTS(text=texto,lang=lingua)

        #nome do arquivo de audio
        audio_path = 'static/audio_exemplo.mp3'

        #salvar o arquivo
        tts.save(audio_path)
    return render_template('index.html',audio_path=audio_path)

if __name__ == '__main__':
        app.run(debug=True)