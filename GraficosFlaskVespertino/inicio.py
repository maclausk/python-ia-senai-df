from flask import Flask,render_template
app = Flask(__name__)
@app.route('/graficolinha')
def mostrar_graf_linha():
    return render_template('imigrantes_brasil.html')

app.run()