nota1 = int(input("Digite primeira nota"))
nota2 = int(input("Digite segunda nota"))
nota3 = int(input("Digite terceira nota"))

soma = nota1 + nota2 + nota3 
media = soma / 3 


print(f"Soma das notas: {soma:.2f}")
print(f"Soma das notas: {soma:.2f}")
          
if media >= 70:
    print("Aluno promovido.")
else:
    print("Aluno retido.")