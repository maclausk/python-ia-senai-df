import random

#looping - repetição - laço
while True:
    numero_aleatorio = random.randint(1,25)
    print(f"número sorteado: {numero_aleatorio}")
    resposta = input("Deseja sortear outro número? (s/n)").strip().lower()
    if resposta != 's':
        print("encerrando o sorteio")
        break

