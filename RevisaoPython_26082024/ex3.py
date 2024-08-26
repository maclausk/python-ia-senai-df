"""
# Programação Orientada a Objetos

Programação Orientada a Objtos
- Flask e Django

Programação Estruturada com OO
- Flet

Programação Funcional
- Lambda

"""

class Aluno():
    def __init__(self,ch,faltas):
        self.ch = ch
        self.faltas = faltas

    def calcular_faltas(self):
        percent_ch = self.ch * (25/100)
        msg = ''
        if self.faltas > percent_ch:
            msg = 'retido'
        else:
            msg = 'promovido'
        return f"faltas-hs permitidas: {percent_ch} você faltou:{self.faltas} horas, resultado: {msg} por faltas"
    


    