import tkinter as tk
from tkinter import messagebox
from random import choice

# Função para verificar o resultado do jogo
def verificar_resultado(escolha_jogador):
    escolhas = ["pedra", "papel", "tesoura"]
    escolha_pc = choice(escolhas)
    resultado = ""

    if escolha_jogador == escolha_pc:
        resultado = "Empate"
    elif (escolha_jogador == "pedra" and escolha_pc == "tesoura") or \
         (escolha_jogador == "papel" and escolha_pc == "pedra") or \
         (escolha_jogador == "tesoura" and escolha_pc == "papel"):
        resultado = "Você ganhou!"
    else:
        resultado = "Você perdeu!"

    messagebox.showinfo("Resultado", f"Você escolheu: {escolha_jogador}\nComputador escolheu: {escolha_pc}\n\n{resultado}")

# Função para criar a janela principal
def criar_janela_principal():
    janela = tk.Tk()
    janela.title("Pedra, Papel e Tesoura")

    # Carregar imagens
    img_pedra = tk.PhotoImage(file="pedra.png")
    img_papel = tk.PhotoImage(file="papel.png")
    img_tesoura = tk.PhotoImage(file="tesoura.png")

    # Botões para escolha do jogador
    btn_pedra = tk.Button(janela, image=img_pedra, command=lambda: verificar_resultado("pedra"))
    btn_pedra.pack(side=tk.LEFT, padx=10, pady=10)

    btn_papel = tk.Button(janela, image=img_papel, command=lambda: verificar_resultado("papel"))
    btn_papel.pack(side=tk.LEFT, padx=10, pady=10)

    btn_tesoura = tk.Button(janela, image=img_tesoura, command=lambda: verificar_resultado("tesoura"))
    btn_tesoura.pack(side=tk.LEFT, padx=10, pady=10)

    janela.mainloop()

# Executar o programa
if __name__ == "__main__":
    criar_janela_principal()