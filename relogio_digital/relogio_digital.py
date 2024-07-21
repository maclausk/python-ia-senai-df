# Relógio Digital

from tkinter import *
from tkinter.ttk import *
from time import strftime

# Importa o módulo Tkinter, que é uma biblioteca padrão do Python para criar interfaces gráficas.
# Importa 'ttk' do Tkinter, que fornece estilos para widgets.
# Importa a função 'strftime' do módulo 'time', que formata a hora.

root = Tk()
root.title("Relógio Digital - Marcelo Avelino")

# Cria uma instância principal da janela chamada 'root'.
# Define o título da janela como "Relógio Digital - Marcelo Avelino".

def update_time():
    string = strftime("%H:%M:%S %p")
    label.config(text=string)
    # chama essa função a cada 1000 milisegundos
    label.after(1000, update_time)

# Define uma função chamada 'update_time' que atualiza a hora.
# Usa 'strftime' para obter a hora atual no formato "Horas:Minutos:Segundos AM/PM".
# Atualiza o texto do rótulo 'label' com a hora atual.
# Usa 'after' para chamar a função 'update_time' novamente após 1000 milissegundos (1 segundo).

label = Label(root, font=("ds-digital", 80), background="black", foreground="#90EE90")
label.pack(anchor="center")
update_time()

# Cria um rótulo ('label') para exibir a hora.
# Define a fonte do rótulo para "ds-digital" com tamanho 80.
# Define a cor de fundo do rótulo como preta e a cor do texto como verde claro (#90EE90).
# Posiciona o rótulo no centro da janela.
# Chama a função 'update_time' para iniciar a atualização da hora.

mainloop()

# Inicia o loop principal da interface gráfica para manter a janela aberta e interativa.