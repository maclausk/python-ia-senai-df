# Jogo da Forca

import random  # Importa a biblioteca 'random' que permite gerar valores aleatórios, que neste programa, será usada para selecionar uma palavra aleatória da lista 'lista_palavras'.

# Lista de palavras que podem ser escolhidas para o jogo.
lista_palavras = ['python', 'programacao', 'computador', 'notebook', 'software', 'openai', 'algoritmo', 'programas']

# Escolhe uma palavra aleatória da lista
palavra = random.choice(lista_palavras)  # Escolhe aleatoriamente uma palavra da lista lista_palavras

# Inicializa listas para letras corretas e erradas
letras_corretas = []  # Lista para armazenar as letras corretas adivinhadas pelo usuário
letras_erradas = []  # Lista para armazenar as letras erradas adivinhadas pelo usuário
tentativas = 6  # Número de tentativas que o usuário tem para adivinhar a palavra

# Loop principal do jogo
while True:  # Cria um loop infinito que será interrompido apenas quando o jogo acabar (break).
    # Inicializa a palavra escondida com underlines
    palavra_escondida = ''  # String para armazenar a palavra com letras adivinhadas ou underlines
    for letra in palavra:  # Percorre cada letra da palavra escolhida
        if letra in letras_corretas:  # Se a letra está na lista de letras corretas, adiciona a letra à palavra escondida.
            palavra_escondida += letra  # Adiciona a letra à palavra escondida
        else:
            palavra_escondida += '_'  # Se a letra não está na lista de letras corretas, adiciona um underline à palavra escondida.

    # Exibe o estado atual da palavra, letras erradas e tentativas restantes
    print('Palavra: ', palavra_escondida)  # Mostra a palavra escondida com letras adivinhadas e underlines
    print('Letras erradas:', letras_erradas)  # Mostra as letras erradas adivinhadas até agora
    print('Tentativas restantes:', tentativas)  # Mostra o número de tentativas restantes

    # Verificar se o usuário ganhou ou perdeu
    if palavra_escondida == palavra:  # Se a palavra escondida é igual à palavra original, o jogador ganhou.
        print('Você acertou!')  # Informa que o usuário acertou a palavra
        break  # Sai do loop
    elif tentativas == 0:  # Se as tentativas acabaram, o jogador perdeu.
        print(f'Você perdeu! A palavra era: {palavra}')  # Informa que o usuário perdeu e mostra a palavra correta
        break  # Sai do loop

    # Solicita ao usuário para digitar uma letra
    letra_usuario = input('Digite uma letra: ').lower()  #  Solicita ao usuário uma letra e a converte para minúscula.

    # Verifica se a letra digitada está na palavra
    if letra_usuario in palavra:  # Verifica se a letra está na palavra
        print('Letra correta!')  # Informa que a letra está correta
        letras_corretas.append(letra_usuario)  # Adiciona a letra à lista de letras corretas.
    else:
        print('Letra incorreta!')  # Informa que a letra está incorreta
        letras_erradas.append(letra_usuario)  # Adiciona a letra à lista de letras erradas e decrementa o número de tentativas.
        tentativas -= 1  # Decrementa o número de tentativas restantes
