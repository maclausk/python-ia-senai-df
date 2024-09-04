# Recebe as três notas do aluno
nota1 = int(input("Digite a primeira nota: "))
nota2 = int(input("Digite a segunda nota: "))
nota3 = int(input("Digite a terceira nota: "))

# Calcula a soma e a média das notas
soma = nota1 + nota2 + nota3
media = soma / 3

# Mostra a soma e a média
print(f"Soma das notas: {soma:.2f}")
print(f"Média das notas: {media:}")

# Verifica se o aluno foi promovido ou retido
if media >= 70:
    print("Aluno promovido.")
else:
    print("Aluno retido.")
