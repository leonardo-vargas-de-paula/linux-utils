#lista de comandos uteis para shell script - estruturas de controle
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

nano meu_script.sh

#exemplo
bash
#!/bin/bash

echo "====================="
echo "   LOOPS EM BASH    "
echo "====================="

# Loop básico com for
echo "Loop for com lista de números:"
for i in 1 2 3 4 5; do
  echo "  Número: $i"
done

# Loop for com sequência usando a sintaxe {início..fim}
echo "Loop for com sequência {1..5}:"
for i in {1..5}; do
  echo "  Valor: $i"
done

# Loop for com strings
echo "Loop for com lista de palavras:"
for palavra in Linux "Shell Script" Automação DevOps; do
  echo "  Palavra: $palavra"
done

# Loop for com substituição de comando
echo "Loop for com arquivos no diretório atual:"
for arquivo in $(ls); do
  echo "  Arquivo: $arquivo"
done

echo "====================="
echo " CONDICIONAIS EM BASH "
echo "====================="

# Verificando se foi fornecido um argumento
if [ $# -eq 0 ]; then
  echo "Nenhum argumento foi fornecido."
  echo "Execute o script com: ./meu_script.sh ARGUMENTO"
else
  echo "Foram fornecidos $# argumentos."
  
  # Verificando o valor do primeiro argumento
  if [ "$1" == "teste" ]; then
    echo "O primeiro argumento é 'teste'!"
  elif [ "$1" == "help" ]; then
    echo "AJUDA: Este script demonstra loops e condicionais em Bash."
  else
    echo "O primeiro argumento é: '$1' (não é 'teste' nem 'help')."
  fi
  
  # Verificando se o argumento é um número
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "'$1' é um número."
    
    # Verificando se o número é par ou ímpar
    if (( $1 % 2 == 0 )); then
      echo "'$1' é um número par."
    else
      echo "'$1' é um número ímpar."
    fi
  else
    echo "'$1' não é um número."
  fi
fi

#executar
./meu_script.sh help
./meu_script.sh 21
#etc

