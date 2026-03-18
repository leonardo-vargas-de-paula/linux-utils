#lista de comandos uteis para shell script
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

nano meu_script.sh # depois adiciona a permissao de x

#exemplo

#!/bin/bash

# Declaração de variáveis (sem espaços ao redor do sinal de igual)
NOME="Aluno Girus"
CURSO="Shell Script"
DATA_ATUAL=$(date +"%d/%m/%Y")

# Usando as variáveis
echo "Olá, $NOME!"
echo "Bem-vindo ao curso de $CURSO"
echo "Hoje é: $DATA_ATUAL"

# Trabalhando com argumentos de linha de comando
echo "----------------------------"
echo "Informações sobre argumentos:"
echo "----------------------------"
echo "O script foi chamado com $# argumento(s)."
echo "O nome do script é: $0"
echo "O primeiro argumento foi: $1"
echo "O segundo argumento foi: $2"
echo "Todos os argumentos: $@"

# Capturando o valor de um argumento em uma variável
ARGUMENTO1=$1
echo "----------------------------"
echo "O valor de ARGUMENTO1 é: $ARGUMENTO1"

#passando argumentos
./meu_script.sh 'Aprendendo Bash' 42
./meu_script.sh argumento1 'argumento com espaços' 123 "outro argumento"


